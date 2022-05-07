;;; Example demonstrating how to use the state macros for convinience
(ql:quickload :cl-liballegro)

(defvar display)

(defun main ()
  ;; Create the display and load the input drivers
  (al:init)
  (al:install-keyboard)
  (al:install-mouse)
  (setf display (al:create-display 800 600))
  ;; This macro will initialize STATE by calling
  ;; (al:get-keyboard-state STATE) for you before the body code.  Use
  ;; WITH-KEYBOARD-STATE to leave uninitialized.
  (al:with-current-keyboard-state state
    (do () ((al:key-down state :escape)) ;; ESC terminates the loop
      (sleep 0.1)
      ;; Mouse state works like the keyboard state macros
      (al:with-current-mouse-state state
        ;; The mouse state can be exploded into a plist
        (let ((plist (cffi:mem-ref state '(:struct al:mouse-state))))
          (format t "X:~a Y:~a~%" (getf plist 'al:x) (getf plist 'al:y))))
      (al:get-keyboard-state state)))
  ;; All done let's cleanup
  (al:destroy-display display)
  (al:uninstall-system))
