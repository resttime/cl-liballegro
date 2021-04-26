(in-package #:cl-user)
(asdf:defsystem cl-liballegro
  :description "Allegro 5 game programming library bindings for Common Lisp"
  :license "zlib"
  :version "0.2.13"
  :author "resttime"
  :depends-on (:cffi
               :cffi-libffi
               :trivial-garbage
               :trivial-main-thread
               :float-features)
  :serial t
  :components
  ((:module "src"
    :components
    ((:file "package")
     (:file "library")
     (:module "constants"
      :components
      ((:file "display")
       (:file "events")
       (:file "file-io")
       (:file "filesystem")
       (:file "fixed-point-math")
       (:file "graphics")
       (:file "haptic")
       (:file "joystick")
       (:file "keyboard")
       (:file "misc")
       (:file "mouse")
       (:file "opengl")
       (:file "touch-input")
       (:file "shader")
       (:file "state")
       (:file "system")
       (:module "addons"
        :components
        ((:file "audio")
         (:file "font")
         (:file "native-dialogs")
         (:file "video-streaming")))))
     (:module "types"
      :components
      ((:file "events")
       (:file "filesystem")
       (:file "file-io")
       (:file "fixed-point-math")
       (:file "fullscreen-modes")
       (:file "graphics")
       (:file "haptic")
       (:file "joystick")
       (:file "keyboard")
       (:file "monitor")
       (:file "mouse")
       (:file "shader")
       (:file "state")
       (:file "time")
       (:file "timer")
       (:file "touch-input")
       (:file "transformations")
       (:file "utf-8")
       (:file "types")
       (:module "addons"
        :components
        ((:file "audio")
         (:file "font")
         (:file "native-dialogs")))))
     (:module "ffi-functions"
      :components
      ((:file "configuration-files")
       (:file "display")
       (:file "events")
       (:file "file-io")
       (:file "filesystem")
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
       (:file "utf-8")
       (:file "misc")
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
      ((:file "interface")))))))
