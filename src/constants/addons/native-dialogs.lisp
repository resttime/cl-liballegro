(in-package :cl-liballegro)

(defbitfield filechooser-modes
  :file-must-exist
  :save
  :folder
  :pictures
  :show-hidden
  :multiple)

(defcenum messagebox-flags
  (:warn 1)
  (:error 2)
  (:ok-cancel 4)
  (:yes-no 8)
  (:question 16))
