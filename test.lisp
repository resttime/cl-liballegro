(require "cl-liballegro")
(ql:quickload "cffi")

(defvar *display*)

(defun main ()
  (al:init)
  (setf *display* (al:create-display 800 600))
  (al:rest-time 3.0d0)
  (al:uninstall-system))

