(in-package #:cl-liballegro)

(defcstruct memory-interface
  (mi-alloc :pointer)
  (mi-free :pointer)
  (mi-realloc :pointer)
  (mi-calloc :pointer))
