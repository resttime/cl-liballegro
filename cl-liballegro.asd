(asdf:defsystem cl-liballegro
  :description "Allegro gmae programming library CFFI."
  :depends-on (cffi)
  :components ((:file "package")
	       (:file "constants" :depends-on ("package"))
	       (:file "types" :depends-on ("package"))
	       (:file "library" :depends-on ("package"))
	       (:file "liballegro" :depends-on ("package"))))
