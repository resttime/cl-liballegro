(in-package :cl-liballegro)

(defcstruct keyboard-state
  (display :pointer)
  (--key-down--internal--
   :uint :count #.(floor (/ (+ (foreign-enum-value 'keycodes :key-max) 31)
                            32))))

(defmacro with-keyboard-state (state &body body)
  `(with-foreign-object (,state '(:struct keyboard-state))
     ,@body))

(defmacro with-current-keyboard-state (state &body body)
  `(with-keyboard-state ,state
     (al:get-keyboard-state ,state)
     ,@body))
