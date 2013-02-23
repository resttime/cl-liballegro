(asdf:defsystem cl-liballegro
  :description "Allegro gmae programming library CFFI."
  :depends-on (cffi)
  :components ((:file "package")
	       (:file "constants" :depends-on ("package"))
	       (:file "library" :depends-on ("package"))
	       (:file "types" :depends-on ("package"))
	       (:file "funcs" :depends-on ("package" "types" "constants"))
		   ;; Lisp Functions/Macros
		   (:file "temp" :depends-on ("funcs" "package" "types" "constants"))))
