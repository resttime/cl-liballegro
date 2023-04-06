;;; Optional file streams interface example
(ql:quickload "cl-liballegro")

;; Text files
(with-open-stream (stream (al:make-character-stream "007-file-streams.lisp"))
  (princ "Here's the first Lisp form from this file:")
  ;; the result of (al:make-character-stream) is just a regular CL stream
  (print (read stream))
  (terpri))

(let ((stream (al:make-character-stream "007-file-streams.lisp")))
  (princ "Here's the first line from this file:")
  (princ (read-line stream))
  (terpri)
  ;; remember to close the stream when finished if not using with-open-stream
  (close stream))

;; Binary files
(with-open-stream (stream (al:make-binary-stream "test.png"))
  ;; the binary stream does not perform any implicit newline conversions
  (let ((sequence (make-array 4 :element-type '(unsigned-byte 8))))
    (read-sequence sequence stream)
    (princ "Here's the test.png file signature: ")
    (loop :for c :across sequence :do (format t "~:c " (code-char c)))))
