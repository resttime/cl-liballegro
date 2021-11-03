(in-package #:cl-liballegro)

;;; Font addons
;; General font routinues
(defcfun ("al_init_font_addon" init-font-addon) :boolean)
(defcfun ("al_shutdown_font_addon" shutdown-font-addon) :void)
(defcfun ("al_load_font" load-font) :pointer
  (filename :string) (size :int) (flags :int))
(defcfun ("al_destroy_font" destroy-font) :void (f :pointer))
(defcfun ("al_register_font_loader" register-font-loader) :boolean
    (extension :string) (load-font :pointer))
(defcfun ("al_get_font_line_height" get-font-line-height) :int (f :pointer))
(defcfun ("al_get_font_ascent" get-font-ascent) :int (f :pointer))
(defcfun ("al_get_font_descent" get-font-descent) :int (f :pointer))
(defcfun ("al_get_text_width" get-text-width) :int (f :pointer) (str :string))
(defcfun ("al_get_ustr_width" get-ustr-width) :int (f :pointer) (ustr :pointer))
(defcfun ("al_draw_text" draw-text) :void
  (font :pointer)
  (color (:struct color))
  (x c-float) (y c-float)
  (flags :int)
  (text :string))
(defcfun ("al_draw_ustr" draw-ustr) :void
  (font :pointer)
  (color (:struct color))
  (x c-float) (y c-float)
  (flags :int)
  (ustr :pointer))
(defcfun ("al_draw_justified_text" draw-justified-text) :void
  (font :pointer)
  (color (:struct color))
  (x1 c-float) (x2 c-float) (y c-float) (diff c-float)
  (flags :int)
  (text :string))
(defcfun ("al_draw_justified_ustr" draw-justified-ustr) :void
  (font :pointer)
  (color (:struct color))
  (x1 c-float) (x2 c-float) (y c-float) (diff c-float)
  (flags :int)
  (ustr :pointer))
(defcfun ("al_draw_textf" draw-textf) :void
  (font :pointer)
  (color (:struct color))
  (x c-float) (y c-float)
  (flags :int)
  (format :string)
  &rest)
(defcfun ("al_draw_justified_textf" draw-justified-textf) :void
  (font :pointer)
  (color (:struct color))
  (x1 c-float) (x2 c-float) (y c-float) (diff c-float)
  (flags :int)
  (format :string)
  &rest)
(defcfun ("al_get_text_dimensions" get-text-dimensions) :void
  (f :pointer) (text :string)
  (bbx :pointer) (bby :pointer)
  (bbw :pointer) (bbh :pointer))
(defcfun ("al_get_ustr_dimensions" get-ustr-dimensions) :void
  (f :pointer) (ustr :pointer)
  (bbx :pointer) (bby :pointer)
  (bbw :pointer) (bbh :pointer))
(defcfun ("al_get_allegro_font_version" get-allegro-font-version) :uint32)

;; Bitmap fonts
(defcfun ("al_grab_font_from_bitmap" grab-font-from-bitmap) :pointer
  (bmp :pointer) (ranges-n :int) (range :pointer))
(defcfun ("al_load_bitmap_font" load-bitmap-font) :pointer (fname :string))
(defcfun ("al_create_builtin_font" create-builtin-font) :pointer)

;; TTF fonts
(defcfun ("al_init_ttf_addon" init-ttf-addon) :boolean)
(defcfun ("al_shutdown_ttf_addon" shutdown-ttf-addon) :void)
(defcfun ("al_load_ttf_font" load-ttf-font) :pointer
  (filename :string) (size :int) (flags :int))
(defcfun ("al_load_ttf_font_f" load-ttf-font-f) :pointer
  (file :pointer) (filename :string) (size :int) (flags :int))
(defcfun ("al_load_ttf_font_stretch" load-ttf-font-stretch) :pointer
  (filename :string) (w :int) (h :int) (flags :int))
(defcfun ("al_load_ttf_font_stretch_f" load-ttf-font-stretch-f) :pointer
  (file :pointer) (filename :string) (w :int) (h :int) (flags :int))
(defcfun ("al_get_allegro_ttf_version" get-allegro-ttf-version) :uint32)
