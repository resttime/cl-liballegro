(in-package #:cl-liballegro)

;; Miscellaneous routines
(defcfun ("al_run_main" run-main) :int
  (argc :int) (argv :pointer) (user-main :pointer))
