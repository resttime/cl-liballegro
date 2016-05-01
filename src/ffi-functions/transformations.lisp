(in-package #:cl-liballegro)

;;; Transformations
(defcfun ("al_copy_transform" copy-transform) :void (dest :pointer) (src :pointer))
(defcfun ("al_use_transform" use-transform) :void (trans :pointer))
(defcfun ("al_get_current_transform" get-current-transform) :pointer)
(defcfun ("al_use_projection_transform" use-projection-transform) :void (trans :pointer))
(defcfun ("al_get_current_projection_transform" get-current-projection-transform) :pointer)
(defcfun ("al_get_current_inverse_transform" get-current-inverse-transform) :pointer)
(defcfun ("al_invert_transform" invert-transform) :void (trans :pointer))
(defcfun ("al_check_inverse" check-inverse) :int (trans :pointer) (tol c-float))
(defcfun ("al_identity_transform" identity-transform) :void (trans :pointer))
(defcfun ("al_build_transform" build-transform) :void
  (trans :pointer) (x c-float) (y c-float) (sx c-float) (sy c-float) (theta c-float)) 
(defcfun ("al_build_camera_transform" build-camera-transform) :void
  (trans :pointer)
  (position-x c-float) (position-y c-float) (position-z c-float)
  (look-x c-float) (look-y c-float) (look-z c-float)
  (up-x c-float) (up-y c-float) (up-z c-float)) 
(defcfun ("al_translate_transform" translate-transform) :void
  (trans :pointer) (x c-float) (y c-float))
(defcfun ("al_rotate_transform" rotate-transform) :void
  (trans :pointer) (theta c-float))
(defcfun ("al_scale_transform" scale-transform) :void
  (trans :pointer) (sx c-float) (sy c-float))
(defcfun ("al_transform_coordinates" transform-coordinates) :void
  (trans :pointer) (x (:pointer :float)) (y (:pointer :float)))
(defcfun ("al_transform_coordinates_3d" transform-coordinates-3d) :void
  (trans :pointer) (x (:pointer :float)) (y (:pointer :float)) (z (:pointer :float)))
(defcfun ("al_compose_transform" compose-transform) :void
  (trans :pointer) (other :pointer))
(defcfun ("al_orthographic_transform" ortohographic-transform) :void
  (trans :pointer)
  (left c-float) (top c-float) (n c-float)
  (leftright c-float) (bottom c-float) (f c-float))
(defcfun ("al_perspective_transform" perspective-transform) :void
  (trans :pointer)
  (left c-float) (top c-float) (n c-float)
  (leftright c-float) (bottom c-float) (f c-float))
(defcfun ("al_translate_transform_3d" translate-transform-3d) :void
  (trans :pointer) (x c-float) (y c-float) (z c-float))
(defcfun ("al_scale_transform_3d" scale-transform-3d) :void
  (trans :pointer) (sx c-float) (sy c-float) (sz c-float))
(defcfun ("al_rotate_transform_3d" rotate-transform-3d) :void
  (trans :pointer) (x c-float) (y c-float) (z c-float) (angle c-float))
(defcfun ("al_horizontal_shear_transform" horizontal-shear-transform) :void
  (trans :pointer) (theta :float))
(defcfun ("al_vertical_shear_transform" vertical-shear-transform) :void
  (trans :pointer) (theta :float))
