(ql:quickload "game")
(in-package #:game)

(defconstant tau (* 2 pi))

(defvar *game-running-p* t)
(defvar *global-time* 0.0)
(defvar *fps* 30)
(defvar *dt* (/ 1.0 *fps*))

(defvar *display*)
(defvar *event-queue*)
(defvar *key-state*)
(defvar *mouse-state*)

(defvar font)
(defvar *player*)
(defvar *begin*)

(defvar *object-list*)
(defvar *ball-timer*)

(defvar *score-font*)
(defvar *score*)

(defun load-game ()
  (setf *game-running-p* t)
  (setf *global-time* 0.0)
  (setf *fps* 30)
  (setf *dt* (/ 1.0 *fps*))
  (setf *begin* nil)
  (setf font (al:load-ttf-font "fonts/DejaVuSansMono.ttf" 10 0))
  (setf *score-font* (al:load-ttf-font "fonts/DejaVuSansMono.ttf" 32 0))
  (setf *object-list* (list))
  (setf *ball-timer* (get-internal-real-time))
  (setf *score* 0)
  (setf *player* (make-instance 'object
				:y 536
				:sprite (al:load-bitmap "sprites/char.png"))))

(defparameter info
  '(list
    (concatenate 'string "Global Time: "
     (write-to-string *global-time*))
    (concatenate 'string "Mouse X: "
     (write-to-string (mousestate 'x)))
    (concatenate 'string "Mouse Y: "
     (write-to-string (mousestate 'y)))
    (concatenate 'string "L Click: "
     (write-to-string (mousestate 1)))))
(defun debug-info (info)
  (loop for len upto (length info) for str in info do
       (al:draw-text font 0 1 0 1 0 (* 10 len) 0 str)))

(defclass object ()
  ((x :accessor x :initarg :x :initform 0.0)
   (y :accessor y :initarg :y :initform 0.0)
   (dx :accessor dx :initarg :dx :initform 0.0)
   (dy :accessor dy :initarg :dy :initform 0.0)
   (ax :accessor ax :initarg :ax :initform 0.0)
   (ay :accessor ay :initarg :ay :initform 0.0)
   (sprite :accessor sprite :initarg :sprite)
   (width :accessor width)
   (height :accessor height)))

(defclass ball (object) ())

(defmethod initialize-instance :after ((obj object) &key)
  (with-slots (width height sprite) obj
    (setf width (al:get-bitmap-width sprite))
    (setf height (al:get-bitmap-height sprite))))

(defgeneric draw-object (obj))
(defmethod draw-object ((obj object))
  (al:draw-bitmap (sprite obj) (x obj) (y obj) 0))

(defgeneric update-object (obj))
(defmethod update-object ((obj object))
  (wait-for-start obj)
  (follow-mouse obj)
  (update-physics obj))

(defmethod wait-for-start ((obj object))
  (with-slots (dy ay) obj
    (if (not *begin*)
	(when (eq t (mousestate 1))
	  (setf dy -500)
	  (setf ay 1000)
	  (setf *begin* t)))))

(defgeneric follow-mouse (obj))
(defmethod follow-mouse ((obj object))
  (with-slots (x y dx dy) obj
    (cond ((< x (- (mousestate 'x) 32)) (setf dx 1000))
	  ((> x (+ (mousestate 'x) 32)) (setf dx -1000))
	  (t (setf dx 0)))))

(defgeneric update-physics (obj))
(defmethod update-physics ((obj object))
  (with-slots (x y dx dy ax ay) obj
    (incf dx (* ax *dt*))
    (incf dy (* ay *dt*))
    (incf x (* dx *dt*))
    (incf y (* dy *dt*))))

(defun create-ball ()
  (push (make-instance 'ball :x (random 800) :y 50
		       :dy 50
		       :sprite (al:load-bitmap "sprites/ball.png")) *object-list*))

(defun update-platforms ()
  (loop for obj in *object-list* do
       (update-physics obj)))

(defun further-left-or-right-p (obj1 obj2)
  (if (or (> (x obj2) (+ (width obj1) (x obj1)))
	  (> (x obj1) (+ (width obj2) (x obj2))))
      t
      nil))
(defun further-up-or-down-p (obj1 obj2)
  (if (or (> (y obj2) (+ (height obj1) (y obj1)))
	  (> (y obj1) (+ (height obj2) (y obj2))))
      t
      nil))

(defmethod collision-p ((obj1 object) (obj2 object))
  (if (or (further-left-or-right-p obj1 obj2)
	  (further-up-or-down-p obj1 obj2))
      nil
      t))

(defun collision-time ()
  (loop for obj in *object-list* do
       (when (collision-p obj *player*)
	 (setf *object-list* (remove obj *object-list*))
	 (incf *score* 100))))

(defun update ()
  (incf *global-time* *dt*)
  (when (> (- (get-internal-real-time) *ball-timer*) 1000)
    (setf *ball-timer* (get-internal-real-time))
    (create-ball))
  (update-object *player*)
  (update-platforms)
  (collision-time))

(defun render ()
  (al:clear-to-color 0.0 0.0 0.0 1.0)
  (debug-info (eval info))
  (al:draw-text *score-font* 0.0 1.0 0.0 1.0 400 0 0 (write-to-string *score*))
  (draw-object *player*)
  (loop for obj in *object-list* do
       (draw-object obj))
  (al:flip-display))

