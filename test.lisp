(ql:quickload "cl-liballegro")

(defvar display)

(defun main ()
  (al:init)
  (setf display (al:create-display 800 600))
  (al:clear-to-color 1 1.0 1.0 1.0)
  (al:flip-display)
  (al:rest-time 2)
  (al:destroy-display display)
  (al:uninstall-system))
