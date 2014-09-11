(in-package #:cl-liballegro)

;;; Transformations
(defcfun ("al_copy_transform" copy-transform) :void (dest :pointer) (src :pointer))
(defcfun ("al_use_transform" use-transform) :void (trans :pointer))
(defcfun ("al_get_current_transform" get-current-transform) :pointer)
(defcfun ("al_invert_transform" invert-transform) :void (trans :pointer))
(defcfun ("al_check_inverse" check-inverse) :int (trans :pointer) (tol c-float))
(defcfun ("al_identity_transform" identity-transform) :void (trans :pointer))
(defcfun ("al_build_transform" build-transform) :void
  (trans :pointer) (x c-float) (y c-float) (sx c-float) (sy c-float) (theta c-float))
(defcfun ("al_translate_transform" translate-transform) :void
  (trans :pointer) (x c-float) (y c-float))
(defcfun ("al_rotate_transform" rotate-transform) :void
  (trans :pointer) (theta c-float))
(defcfun ("al_scale_transform" scale-transform) :void
  (trans :pointer) (sx c-float) (sy c-float))
(defcfun ("al_transform_coordinates" transform-coordinates) :void
  (trans :pointer) (x c-float) (y c-float))
(defcfun ("al_compose_transform" compose-transform) :void
  (trans :pointer) (other :pointer))
