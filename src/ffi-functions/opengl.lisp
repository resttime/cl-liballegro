(in-package #:cl-liballegro)

;;; OpenGL
(defcfun ("al_get_opengl_extension_list" get-opengl-extension-list) :pointer)
(defcfun ("al_get_opengl_proc_address" get-opengl-proc-address) :pointer
  (name :string))
(defcfun ("al_get_opengl_texture" get-opengl-texture) :uint (bitmap :pointer))
(defcfun ("al_get_opengl_texture_size" get-opengl-texture-size) :void
  (bitmap :pointer) (width :pointer) (height :pointer))
(defcfun ("al_get_opengl_texture_position" get-opengl-texture-position) :void
  (bitmap :pointer) (u :pointer) (v :pointer))
(defcfun ("al_get_opengl_program_object" get-opengl-program-object) :uint (shader :pointer))
(defcfun ("al_get_opengl_fbo" get-opengl-fbo) :uint
  (bitmap :pointer))
(defcfun ("al_remove_opengl_fbo" remove-opengl-fbo) :uint
  (bitmap :pointer))
(defcfun ("al_have_opengl_extension" have-opengl-extension) :boolean
  (extension :string))
(defcfun ("al_get_opengl_version" get-opengl-version) :uint32)
(defcfun ("al_get_opengl_variant" get-opengl-variant) opengl-variant)
(defcfun ("al_set_current_opengl_context" set-current-opengl-context) :void
  (display :pointer))
