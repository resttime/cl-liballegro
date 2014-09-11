(in-package #:cl-liballegro)

;;; Direct3D
(defcfun ("al_get_d3d_device" get-d3d-device) :pointer (display :pointer))
(defcfun ("al_get_d3d_system_texture" get-d3d-system-texture) :pointer (bitmap :pointer))
(defcfun ("al_get_d3d_video_texture" get-d3d-video-texture) :pointer (bitmap :pointer))
(defcfun ("al_have_d3d_non_pow2_texture_support" have-d3d-non-pow2-texture-support) :boolean)
(defcfun ("al_have_d3d_non_square_texture_support" have-d3d-non-square-texture-support) :boolean)
(defcfun ("al_get_d3d_texture_position" get-d3d-texutre-positioner) :void
  (bitmap :pointer) (u :pointer) (v :pointer))
(defcfun ("al_is_d3d_device_lost" is-d3d-device-lost) :boolean (display :pointer))
