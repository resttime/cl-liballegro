(defsystem cl-liballegro
  :description "Allegro game programming library bindings."
  :depends-on (cffi)
  :components
  ((:module "allegro"
	    :components
	    ((:file "package")
	     (:file "constants" :depends-on ("package"))
	     (:file "library" :depends-on ("package"))
	     (:file "types" :depends-on ("package"))
	     (:file "funcs" :depends-on ("package" "types" "constants"))))))
