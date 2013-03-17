(load "allegro.lisp")
(defpackage :game
  (:use :common-lisp :allegro :cffi)
  (:export "MAIN"))

(in-package :game)

(defclass object ()
  ((bitmap      :accessor bitmap)
   (bitmap-path :accessor bitmap-path :initarg :bitmap-path :initform "")
   (x           :accessor x           :initarg :x :initform 0.0)
   (y           :accessor y           :initarg :y :initform 0.0)
   (dx          :accessor dx          :initarg :dx :initform 0.0)
   (dy          :accessor dy          :initarg :dy :initform 0.0)
   (ax           :accessor ax         :initarg :ax :initform 0.0)
   (ay           :accessor ay         :initarg :ay :initform 0.0)))

(defclass stats ()
  ((health :accessor health :initarg health :initform 100.0)))

(defclass hero (object stats)
  ((bitmap-path :initform "test.png")
   (jumping :accessor jumping :initform nil)
   (attacking :accessor attacking :initform nil)
   (grappling :accessor grappling :initform nil)
   (grapple-x :accessor grapple-x :initform nil)
   (grapple-y :accessor grapple-y :initform nil)))

(defclass enemy (object stats)
  ((bitmap-path ::initform "test.png")))

(defclass bullet (object)
  ((bitmap-path :initform "bullet.png")
   (angle :accessor angle :initarg :angle :initform 0.0)))
(defclass grapple-hook (bullet) ())

(defmethod initialize-instance :after ((obj object) &key)
  (setf (bitmap obj)
	(al-load-bitmap (foreign-string-alloc (bitmap-path obj)))))

(defclass input-state ()
  ((right-key :accessor right-key :initform nil)
   (up-key :accessor up-key :initform nil)
   (down-key :accessor down-key :initform nil)
   (left-key :accessor left-key :initform nil)
   (space-key :accessor space-key :initform nil)
   (left-mouse-btn :accessor left-mouse-btn :initform nil)
   (right-mouse-btn :accessor right-mouse-btn :initform nil)
   (x-mouse-coordinate :accessor x-mouse-coordinate :initform 0.0)
   (y-mouse-coordinate :accessor y-mouse-coordinate :initform 0.0)))

(defparameter *game-running* t)
(defparameter *window-width* 800)
(defparameter *window-height* 600)
(defparameter *fps* 125)
(defparameter *timer-dt* (/ 1.0d0 *fps*)) 
(defparameter *dt* (coerce *timer-dt* 'single-float))

(defparameter *object-list* (list))
(defparameter *input-state* (make-instance 'input-state))

(defvar *display* (null-pointer))
(defvar *event-queue* (null-pointer))
(defvar *update-game-event-timer* (null-pointer))


(defun is-further-left-or-right? (obj1 obj2)
  (let ((obj1-width (al-get-bitmap-width (bitmap obj1)))
	(obj2-width (al-get-bitmap-width (bitmap obj2))))
    (if (or (> (x obj2) (+ (x obj1) obj1-width))
	    (> (x obj1) (+ (x obj2) obj2-width)))
	t
	nil)))
(defun is-further-up-or-down? (obj1 obj2)
  (let ((obj1-height (al-get-bitmap-height (bitmap obj1)))
	(obj2-height (al-get-bitmap-height (bitmap obj2))))
    (if (or (> (y obj2) (+ (y obj1) obj1-height))
	    (> (y obj1) (+ (y obj2) obj2-height)))
	t
	nil)))
(defun detect-collide (obj1 obj2)
  (if (or (is-further-left-or-right? obj1 obj2)
	  (is-further-up-or-down? obj1 obj2))
      nil
      t))

(defgeneric fire-bullet (obj))
(defmethod fire-bullet ((obj object))
  (with-slots (x y) obj
    (let ((theta (atan (/ (- y (y-mouse-coordinate *input-state*))
			  (- (x-mouse-coordinate *input-state*) x)))))
      (if (> x (x-mouse-coordinate  *input-state*))
	  (incf theta +allegro-pi+))
      (push (make-instance 'bullet :x x :y y
			   :dx (* 300.0 (cos theta))
			   :dy (* -300.0 (sin theta))
			   :angle (- theta))
	    *object-list*)
      (incf theta (/ +allegro-pi+ 32.0))
      (push (make-instance 'bullet :x x :y y
			   :dx (* 300.0 (cos theta))
			   :dy (* -300.0 (sin theta))
			   :angle (- theta))
	    *object-list*)
      (decf theta (/ +allegro-pi+ 32.0))
      (decf theta (/ +allegro-pi+ 32.0))
      (push (make-instance 'bullet :x x :y y
			   :dx (* 300.0 (cos theta))
			   :dy (* -300.0 (sin theta))
			   :angle (- theta))
	    *object-list*))))

(defgeneric fire-grappling-hook (obj))
(defmethod fire-grappling-hook ((obj object))
  (with-slots (x y) obj
    (let ((theta (atan (/ (- y (y-mouse-coordinate *input-state*))
			  (- (x-mouse-coordinate *input-state*) x)))))
      (if (> x (x-mouse-coordinate  *input-state*))
	  (incf theta +allegro-pi+))
      (push (make-instance 'grapple-hook :x x :y y
			   :dx (* 300.0 (cos theta))
			   :dy (* -300.0 (sin theta))
			   :angle (- theta))
	    *object-list*))))

(defgeneric update-object (obj))
(defmethod update-object ((obj hero))
  (with-slots (x y dx dy ax ay jumping attacking) obj
    (if (right-key *input-state*)
	(incf x (* 100.0 *dt*)))
    (if (left-key *input-state*)
	(decf x (* *dt* 100.0)))
    (when (and (up-key *input-state*) (not (jumping obj)))
      (setf (jumping obj) t)
      (setf dy -300.0))
    (if (left-mouse-btn *input-state*)
	(unless (attacking obj)
	  (setf (attacking obj) t)
	  (fire-bullet obj))
	(setf (attacking obj) nil))
    (incf dx (* ax *dt*))
    (incf x (* dx *dt*))
    (incf dy (* ay *dt*))
    (incf y (* dy *dt*))
    (when (> y (- *window-height* 52.0))
      (setf y (- *window-height* 52.0))
      (setf (jumping obj) nil))
    (if (< x 0.0)
	(setf x 0.0))
    (if (> x (- *window-width* 36.0))
	(setf x (- *window-width* 36.0)))))

(defmethod update-object ((obj enemy))
  (with-slots (health) obj
    (if (< health 0.0)
	(setf *object-list* (remove obj *object-list*)))))

(defmethod update-object ((obj bullet))
  (with-slots (x y dx dy ax ay) obj
    (incf dy (* ay *dt*))
    (incf y (* dy *dt*))
    (incf dx (* ax *dt*))
    (incf x (* dx *dt*))
    (loop for other-object in *object-list* do
	 (if (typep other-object 'enemy)
	     (when (detect-collide obj other-object)
	       (setf *object-list* (remove obj *object-list*))
	       (decf (health other-object) 5.0))))
    (if (or (< y 0.0)
	    (> y 600.0))
	(setf *object-list* (remove obj *object-list*)))
    (if (or (< x 0.0 )
	    (> x 800.0))
	(setf *object-list* (remove obj *object-list*)))))

(defmethod update-object ((obj grapple-hook))
  (with-slots (x y dx dy ax ay) obj
    (incf dy (* ay *dt*))
    (incf y (* dy *dt*))
    (incf dx (* ax *dt*))
    (incf x (* dx *dt*))
    (loop for other-object in *object-list* do
	 (if (typep other-object 'enemy)
	     (when (detect-collide obj other-object)
	       (setf dx 0.0)
	       (setf dy 0.0)
	       (setf (slot-value (first (last *object-list*)) 'dx) 300.0)
	       (setf *object-list* (remove obj *object-list*)))))
    (if (or (< y 0.0)
	    (> y 600.0))
	(setf *object-list* (remove obj *object-list*)))
    (if (or (< x 0.0 )
	    (> x 800.0))
	(setf *object-list* (remove obj *object-list*)))))

(defmethod update-object ((obj object))
  (with-slots (x y dx dy ax ay) obj
    (incf dx (* ax *dt*))
    (incf x (* dx *dt*))
    (if (< x 0.0)
	(setf dx 500.0))))


(defgeneric draw-object (obj))
(defmethod draw-object ((obj object))
  (al-draw-bitmap (bitmap obj) (x obj) (y obj) 0))
(defmethod draw-object ((obj enemy))
  (with-slots (health) obj
    (let ((tint (/ health 100.0)))
      (al-draw-tinted-bitmap (bitmap obj)
			     1.0 (* tint 1.0) (* tint 1.0) 1.0
			     (x obj) (y obj) 0))))
(defmethod draw-object ((obj bullet))
  (al-draw-rotated-bitmap (bitmap obj) 9.0 4.0
			  (- (x obj) 9) (- (y obj) 4)
			  (angle obj) 0))


(defun keyboard-handler (keyboard)
  (with-keyboard-slots keyboard
    (let ((state (= type +allegro-event-key-down+)))
      (cond ((= keycode +allegro-key-right+) (setf (right-key *input-state*) state))
	    ((= keycode +allegro-key-left+) (setf (left-key *input-state*) state))
	    ((= keycode +allegro-key-up+) (setf (up-key *input-state*) state))
	    ((= keycode +allegro-key-down+) (setf (down-key *input-state*) state))
	    ((= keycode +allegro-key-space+) (setf (space-key *input-state*) state))))))

(defun mouse-handler (mouse)
  (with-mouse-slots mouse
    (let ((state (= type +allegro-event-mouse-button-down+)))
      (cond ((= button 1) (setf (left-mouse-btn *input-state*) state))
	    ((= button 2) (setf (right-mouse-btn *input-state*) state)))
      (setf (x-mouse-coordinate *input-state*) x)
      (setf (y-mouse-coordinate *input-state*) y))))

(defun update-object-list (obj-list)
  (loop for obj in obj-list do
       (if (listp obj)
	   (update-object-list obj)
	   (update-object obj))))

(defun update-game ()
  (update-object-list *object-list*))

(defun display-game ()
  (al-clear-to-color 1.0 1.0 1.0 1.0)
  (loop for obj in *object-list* do
       (draw-object obj))
  (al-flip-display))

(defmacro with-allegro-event-loop (ev &body body)
  `(with-allegro-event ,ev
     (let ((redraw nil)
	   (event-type))
       (loop while *game-running* do
	    (al-wait-for-event *event-queue* ,ev)
	    (setf event-type (get-event-type ev))
	    (if (= +allegro-event-timer+ (get-event-type ,ev))
		(progn
		  (setf redraw t)
		  (update-game))
		,@body)
	    (when (and redraw (al-is-event-queue-empty *event-queue*))
	      (setf redraw nil)
	      (display-game))))))

(defun is-keyboard-event? (ev)
  (if (or (= +allegro-event-key-down+ (get-event-type ev))
	  (= +allegro-event-key-up+ (get-event-type ev)))
      t
      nil))

(defun is-event-display-close? (ev)
  (if (= +allegro-event-display-close+ (get-event-type ev))
      t
      nil))

(defun is-mouse-event? (ev)
  (if (or (= +allegro-event-mouse-button-down+ (get-event-type ev))
	  (= +allegro-event-mouse-button-up+ (get-event-type ev))
	  (= +allegro-event-mouse-axes+ (get-event-type ev)))
      t
      nil))

(defun event-handler (ev)
  (cond ((is-keyboard-event? ev) (keyboard-handler (get-keyboard ev)))	
	((is-mouse-event? ev) (mouse-handler (get-mouse ev)))	
	((is-event-display-close? ev) (setf *game-running* nil))))

(defun game-loop ()
  (with-allegro-event-loop ev
    (event-handler ev)))

(defun initialize-display ()
  (setf *display* (al-create-display *window-width* *window-height*))
  (al-clear-to-color 0.0 0.0 0.0 1.0)
  (al-flip-display))

(defun initialize-events ()
  (setf *update-game-event-timer* (al-create-timer *timer-dt*))
  (setf *event-queue* (al-create-event-queue))
  (al-register-event-source *event-queue*
			    (al-get-display-event-source *display*))
  (al-register-event-source *event-queue*
			    (al-get-timer-event-source *update-game-event-timer*))
  (al-register-event-source *event-queue*
			    (al-get-keyboard-event-source))
  (al-register-event-source *event-queue*
			    (al-get-mouse-event-source))
  (al-start-timer *update-game-event-timer*))

(defun initialize-allegro ()
  (al-init)
  (al-init-image-addon)
  (al-init-font-addon)
  (al-install-audio)
  (al-init-acodec-addon)
  (al-init-primitives-addon)
  (al-install-keyboard)
  (al-install-mouse))

(defun initialize-game ()
  (setf *game-running* t)
  (initialize-allegro)
  (initialize-display)
  (initialize-events)
  (setf *object-list*
	(list (make-instance 'object :y 100.0 :ax -400.0 :bitmap-path "test.png")
	      (make-instance 'enemy :x 364.0 :y 548.0)
	      (make-instance 'hero :ay 500.0 :y (- *window-height* 52.0)))))

(defun shutdown-game ()
  (al-destroy-timer *update-game-event-timer*)
  (al-destroy-display *display*)
  (al-destroy-event-queue *event-queue*)
  (al-uninstall-system))

(defun main ()
  (initialize-game)
  (game-loop)
  (shutdown-game))
