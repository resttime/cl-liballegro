(in-package #:cl-user)
(asdf:defsystem cl-liballegro
    :description "Allegro 5 game programming library bindings for Common Lisp"
    :license "Allegro 5 - http://alleg.sourceforge.net/license.html"
    :version "0.1.0"
    :author "resttime"
    :serial t
    :components
    ((:module "src"
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
                         (:file "haptic")
			 (:file "joystick")
			 (:file "keyboard")
			 (:file "monitor")
			 (:file "mouse")
			 (:file "path")
                         (:file "shader")
			 (:file "state")
			 (:file "system")
			 (:file "time")
			 (:file "timer")
                         (:file "touch-input")
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
				   (:file "primatives")
                                   (:file "video-streaming")))))
	       ;; Higher Level Lisp API
	       (:module "interface"
			:components
			((:file "interface"))))))
    :depends-on (:cffi-libffi
		 :trivial-garbage))
