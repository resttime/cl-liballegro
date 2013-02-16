(asdf:defsystem cl-liballegro
  :description "Allegro gmae programming library CFFI."
  :depends-on (cffi)
  :components ((:file "package")
	       (:file "library" :depends-on ("package"))
	       (:file "liballegro" :depends-on ("package"))))
