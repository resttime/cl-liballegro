(ql:quickload "cl-liballegro")

(defclass window (al:system)
  ((previous-key :initform "Nothing" :accessor previous-key))
  (:default-initargs :title "Simple"
    :width 800 :height 600
    :logic-fps 1
    :display-flags '(:windowed :opengl :resizable)
    :display-options '((:sample-buffers 1 :suggest)
		       (:samples 4 :suggest))))

(defmethod al:update ((sys window))
  (print 'one-logic-frame))

(defmethod al:render ((sys window))
  (al:clear-to-color (al:map-rgb 20 150 100))
  (al:flip-display))

(defmethod al:key-down-handler ((sys window))
  (print (previous-key sys))
  (setf (previous-key sys) (al:keycode-of (al:event sys))))

(defun main ()
  (al:run-system (make-instance 'window)))
