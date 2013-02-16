(in-package :asdf)

(defsystem cl-liballegro
  :description "Allegro gmae programming library CFFI."
  :depends-on (cffi)
  :components ((:file "package")
	       (:file "cl-liballegro")))
