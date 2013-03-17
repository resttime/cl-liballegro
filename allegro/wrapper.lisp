(in-package #:cl-liballegro)

(define-foreign-library wrapper
  (:windows "wrapper.dll"))
(use-foreign-library wrapper)

(defcfun ("lisp_al_map_rgb" map-rgb) :pointer (r :uchar) (g :uchar) (b :uchar))
