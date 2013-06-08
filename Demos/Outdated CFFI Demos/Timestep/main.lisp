(in-package #:game)

(defparameter *game-running-p* t)

(defparameter *global-time* 0.0)
(defparameter *dt* 1000)
(defparameter *current-time* (get-internal-real-time))
(defparameter *accumulator* 0.0)

(defun quit () (setf *game-running-p* nil))

(defvar font)
(defun update ())
(defun render (alpha)
  (al:clear-to-color 0.0 0.0 0.0 1.0)
  (al:draw-text font 1.0 1.0 1.0 1.0 0 0 0 (write-to-string (+ *global-time* alpha)))
  (al:flip-display))

(defun game-loop ()
  (setf font (al:load-ttf-font "./fonts/DejaVuSansMono.ttf" 72 0))
  (let ((new-time)
	(frame-time))
    (setf *current-time* (get-internal-real-time))
    (loop while *game-running-p* do
	 (setf new-time (get-internal-real-time))
	 (setf frame-time (- new-time *current-time*))
	 (if (> frame-time 200)
	     (setf frame-time 200))
	 (setf *current-time* new-time)
	 (incf *accumulator* frame-time)
	 (loop while (>= *accumulator* *dt*) do
	      (update)
	      (incf *global-time* *dt*)
	      (decf *accumulator* *dt*))
	 (render (/ *accumulator* *dt*)))))

(defun main ()
  (startup)
  (game-loop)
  (shutdown))
