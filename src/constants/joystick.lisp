(in-package :cl-liballegro)

(defconstant +max-joystick-axes+ 3)
(defconstant +max-joystick-sticks+ 16)
(defconstant +max-joystick-buttons+ 32)

(defcenum joyflags
  (:digital #x01)
  (:analogue #x02))
