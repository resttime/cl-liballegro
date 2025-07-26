(ql:quickload "cl-liballegro")

(in-package :cl-user)

(defun init-platform-specific ()
  )

(defun abort-example (message)
  (format *error-output* message)
  (error message))

(defun open-log ()
  )

(defun close-log ()
  )

(defun log-print (message)
  (format *standard-output* message)
  )
