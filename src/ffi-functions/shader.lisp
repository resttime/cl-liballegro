(in-package #:cl-liballegro)

;; Shader
(defcfun ("al_create_shader" create-shader) :pointer
  (platform shader-platform))
(defcfun ("al_attach_shader_source" attach-shader-source) :bool
  (shader (:pointer (:struct shader))) (type shader-type) (source :string))
(defcfun ("al_attach_shader_source_file" attach-shader-source-file) :bool
  (shader (:pointer (:struct shader))) (type shader-type) (filename :string))
(defcfun ("al_build_shader" build-shader) :bool
  (shader (:pointer (:struct shader))))
(defcfun ("al_get_shader_log" get-shader-log) :string
  (shader (:pointer (:struct shader))))
(defcfun ("al_get_shader_platform" get-shader-platform) shader-platform
  (shader (:pointer (:struct shader))))
(defcfun ("al_use_shader" use-shader) :bool (shader :pointer))
(defcfun ("al_destroy_shader" destroy-shader) :void (shader :pointer))
(defcfun ("al_set_shader_sampler" set-shader-sampler) :bool
  (name :string) (bitmap :pointer) (unit :int))
(defcfun ("al_set_shader_matrix" set-shader-matrix) :bool
  (name :string) (matrix :pointer))
(defcfun ("al_set_shader_int" set-shader-int) :bool
  (name :string) (i :int))
(defcfun ("al_set_shader_float" set-shader-float) :bool
  (name :string) (f :float))
(defcfun ("al_set_shader_bool" set-shader-bool) :bool
  (name :string) (b :bool))
(defcfun ("al_set_shader_int_vector" set-shader-int-vector) :bool
  (name :string) (num-components :int) (i (:pointer :int)) (num-elems :int))
(defcfun ("al_set_shader_float_vector" set-shader-float-vector) :bool
  (name :string) (num-components :int) (f (:pointer :float)) (num-elems :int))
(defcfun ("al_get_default_shader_source" get-default-shader-source) :string
  (platform shader-platform) (type shader-type))
