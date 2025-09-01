(in-package #:cl-liballegro)

(defcstruct vertex
  (x :float)
  (y :float)
  (z :float)
  (u :float)
  (v :float)
  (color (:struct color)))

(defcstruct vertex-element
  (attribute :int)
  (storage :int)
  (offset :int))
