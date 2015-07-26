(in-package #:cl-liballegro)

;;; Color addon
(defcfun ("al_color_cmyk" color-cymk) (:struct color)
  (c c-float) (m c-float) (y c-float) (k c-float))
(defcfun ("al_color_cmyk_to_rgb" color-cmyk-to-rgb) :void
  (cyan c-float) (magenta c-float) (yellow c-float) (key c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_hsl" color-hsl) (:struct color)
  (h c-float) (s c-float) (l c-float))
(defcfun ("al_color_hsl_to_rgb" color-hsl-to-rgb) :void
  (hue c-float) (saturation c-float) (lightness c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_hsl" color-hsv) (:struct color)
  (h c-float) (s c-float) (r c-float))
(defcfun ("al_color_hsv_to_rgb" color-hsv-to-rgb) :void
  (hue c-float) (saturation c-float) (value c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_html" color-html) (:struct color) (string :string))
(defcfun ("al_color_html_to_rgb" color-html-to-rgb) :void
  (string :string) (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_rgb_to_html" color-rgb-to-html) :void
  (red c-float) (green c-float) (blue c-float) (string :string))
(defcfun ("al_color_name" color-name) (:struct color) (name :string))
(defcfun ("al_color_name_to_rgb" color-name-to-rgb) :boolean
  (name :string) (r :pointer) (g :pointer) (b :pointer))
(defcfun ("al_color_rgb_to_cmyk" color-rgb-to-cmyk) :void
  (red c-float) (green c-float) (blue c-float)
  (cyan :pointer) (magenta :pointer) (yellow :pointer) (key :pointer))
(defcfun ("al_color_rgb_to_hsl" color-rgb-to-hsl) :void
  (red c-float) (green c-float) (blue c-float)
  (hue :pointer) (saturation :pointer) (lightness :pointer))
(defcfun ("al_color_rgb_to_hsv" color-rgb-to-hsv) :void
  (red c-float) (green c-float) (blue c-float)
  (hue :pointer) (saturation :pointer) (value :pointer))
(defcfun ("al_color_rgb_to_name" color-rgb-to-name) :string
  (r c-float) (g c-float) (b c-float))
(defcfun ("al_color_rgb_to_yuv" color-rgb-to-yuv) :void
  (red c-float) (green c-float) (blue c-float)
  (y :pointer) (u :pointer) (v :pointer))
(defcfun ("al_color_yuv" color-yuv) (:struct color)
  (y c-float) (u c-float) (v c-float))
(defcfun ("al_color_yuv_to_rgb" color-yuv-to-rgb) :void
  (y c-float) (u c-float) (v c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_get_allegro_color_version" get-allegro-color-version) :uint32)
