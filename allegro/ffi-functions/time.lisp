(in-package #:cl-liballegro)

;;; Time
(defcfun ("al_get_time" get-time) c-double)
(defun current-time () (get-time))
(defcfun ("al_init_timeout" init-timeout) :void
  (timeout :pointer) (seconds c-double))
(defcfun ("al_rest" rest-time) :void (seconds c-double))
