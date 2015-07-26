(in-package #:cl-liballegro)

;;; State
(defcfun ("al_restore_state" restore-state) :void (state :pointer))
(defcfun ("al_store_state" store-state) :void
  (state :pointer) (flags state-flags))
(defcfun ("al_get_errno" get-errno) :int)
(defcfun ("al_set_errno" set-errno) :void (errnum :int))
