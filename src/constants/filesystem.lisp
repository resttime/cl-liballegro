(in-package #:cl-liballegro)

(defbitfield file-mode
  :read
  :write
  :execute
  :hidden
  :isfile
  :isdir)

(defcenum for-each-fs-entry-result
  (:error -1)
  (:ok 0)
  (:skip 1)
  (:stop 2))
