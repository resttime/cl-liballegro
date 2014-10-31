(ql:quickload "cl-liballegro")
(defclass window (al:system) ()
  (:default-initargs :display-flags '(:windowed :opengl :resizable)
    :title "Hurray!"))

(defmethod al:render ((sys window))
  (al:clear-to-color (al:map-rgb 20 150 100))
  (al:flip-display))

(defmethod al:key-down-handler ((sys window))
  (print (al:keycode-of (al:event sys))))

(defun main ()
  (al:run-system (make-instance 'window)))
