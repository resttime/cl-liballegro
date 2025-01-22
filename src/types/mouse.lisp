(in-package :cl-liballegro)

(defcstruct mouse-state
  (x :int)
  (y :int)
  (z :int)
  (w :int)
  (more-axis :int :count #.+mouse-max-extra-axes+)
  (buttons :int)
  (pressure :float)
  (display :pointer))

(defmacro with-mouse-state (state &body body)
  `(with-foreign-object (,state '(:struct mouse-state))
     ,@body))

(defmacro with-current-mouse-state (state &body body)
  `(with-mouse-state ,state
     (al:get-mouse-state ,state)
     ,@body))

(defmacro with-mouse-state-slots ((&rest slots) state &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec
          slots '(x y z w more-axis buttons pressure display))
        ,state (:struct mouse-state))
     ,@body))
