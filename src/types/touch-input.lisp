(in-package #:cl-liballegro)

(defcstruct touch-input)
(defcstruct touch-state
  (id :int)
  (x :float)
  (y :float)
  (dx :float)
  (dy :float)
  (primary :bool)
  (display :pointer))
(defcstruct touch-input-state
  (touches (:struct touch-state) :count #.+touch-input-max-touch-count+))
