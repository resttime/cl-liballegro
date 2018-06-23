(in-package :cl-liballegro)

(defcenum align-flags
  (:left 0)
  (:centre 1)
  (:center 1)
  (:right 2)
  (:integer 4))

(defbitfield ttf-flags
  :no-kerning
  :monochrome
  :no-autohint)
