(defsystem game
  :description "A game."
  :depends-on (cl-liballegro)
  :components  ((:file "package")
		(:file "initialize" :depends-on ("package"))))
