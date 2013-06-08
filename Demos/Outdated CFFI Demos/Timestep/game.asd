(defsystem game
  :description "A game."
  :depends-on (cl-liballegro)
  :components  ((:file "package")
		(:file "funcs" :depends-on ("package"))
		(:file "main" :depends-on ("funcs" "package"))))
