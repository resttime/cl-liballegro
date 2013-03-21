(in-package #:cl-liballegro)

(define-foreign-library wrapper
  (t "wrapper.dll"))
(use-foreign-library wrapper)

;;; Graphics
;; Color
(defclass allegro-color ()
  ((r :accessor r :initarg :r)
   (g :accessor g :initarg :g)
   (b :accessor b :initarg :b)
   (a :accessor a :initarg :a)))
(defcstruct allegro-color-ptr
  (r :float)
  (g :float)
  (b :float)
  (a :float))
(define-foreign-type c-allegro-color ()
  ()
  (:actual-type :pointer)
  (:simple-parser c-allegro-color))
(defmethod translate-from-foreign (pointer (type c-allegro-color))
  (with-foreign-slots ((r g b a) pointer allegro-color-ptr)
    (foreign-free pointer)
    (make-instance 'allegro-color :r r :g g :b b :a a)))

(defcfun ("lisp_al_map_rgb" map-rgb) c-allegro-color (r :uchar) (g :uchar) (b :uchar))
(defcfun ("lisp_al_map_rgb_f" map-rgb-f) c-allegro-color
  (r c-float) (g c-float) (b c-float))
(defcfun ("lisp_al_map_rgba" map-rgba) c-allegro-color
  (r :uchar) (g :uchar) (b :uchar) (a :uchar))
(defcfun ("lisp_al_map_rgba_f" map-rgba-f) c-allegro-color
  (r c-float) (g c-float) (b c-float) (a c-float))

;; Bitmap properties
(defcfun ("lisp_al_get_pixel" get-pixel) c-allegro-color
  (bitmap :pointer) (x c-int) (y c-int))

