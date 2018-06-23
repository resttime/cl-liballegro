(in-package :cl-liballegro)

(defcstruct display-mode
  (width :int)
  (height :int)
  (format :int)
  (refresh-rate :int))
