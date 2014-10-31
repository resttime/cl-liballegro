(defsystem cl-liballegro
  :description "Allegro game programming library bindings."
  :depends-on (cffi cffi-libffi trivial-garbage)
  :serial t
  :components
  ((:module "allegro"
	    :components
	    ((:file "package")
	     (:file "constants")
	     (:file "library" )
	     (:file "types")
	     (:file "type-accessors")
	     (:module "ffi-functions"
		      :components
		      ((:file "configuration-files")
		       (:file "display")
		       (:file "events")
			   (:file "file-io")
		       (:file "fixed-point-math")
		       (:file "fullscreen-modes")
		       (:file "graphics")
		       (:file "joystick")
		       (:file "keyboard")
		       (:file "monitor")
		       (:file "mouse")
		       (:file "path")
		       (:file "state")
		       (:file "system")
		       (:file "time")
		       (:file "timer")
		       (:file "transformations")
		       (:file "platform-specific")
		       (:file "direct3d")
		       (:file "opengl")
		       (:module "addons"
				:components
				((:file "audio")
				 (:file "audio-codecs")
				 (:file "color")
				 (:file "font")
				 (:file "image-io")
				 (:file "memfile")
				 (:file "native-dialogs")
				 (:file "physicsfs")
				 (:file "primatives")))))
	     ;; Higher Level Lisp API
	     (:module "interface"
		      :components
		      ((:file "interface")))))))
