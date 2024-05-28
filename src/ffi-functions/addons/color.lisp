(in-package #:cl-liballegro)

;;; Color addon
(defcfun ("al_color_cmyk" color-cmyk) (:struct color)
  (c c-float) (m c-float) (y c-float) (k c-float))
(defcfun ("al_color_cmyk_to_rgb" color-cmyk-to-rgb) :void
  (cyan c-float) (magenta c-float) (yellow c-float) (key c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_hsl" color-hsl) (:struct color)
  (h c-float) (s c-float) (l c-float))
(defcfun ("al_color_hsl_to_rgb" color-hsl-to-rgb) :void
  (hue c-float) (saturation c-float) (lightness c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_hsv" color-hsv) (:struct color)
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
(defcfun ("al_color_rgb_to_xyz" color-rgb-to-xyz) :void
  (r c-float) (g c-float) (b c-float)
  (x :pointer) (y :pointer) (z :pointer))
(defcfun ("al_color_xyz" color-xyz) (:struct color)
  (x c-float) (y c-float) (z c-float))
(defcfun ("al_color_xyz_to_rgb" color-xyz-to-rgb) :void
  (x c-float) (y c-float) (z c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_rgb_to_xyy" color-rgb-to-xyy) :void
  (r c-float) (g c-float) (b c-float)
  (x :pointer) (y :pointer) (y2 :pointer))
(defcfun ("al_color_xyy" color-xyy) (:struct color)
  (x c-float) (y c-float) (y2 c-float))
(defcfun ("al_color_xyy_to_rgb" color-xyy-to-rgb) :void
  (x c-float) (y c-float) (y2 c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_rgb_to_lab" color-rgb-to-lab) :void
  (red c-float) (green c-float) (blue c-float)
  (l :pointer) (a :pointer) (b :pointer))
(defcfun ("al_color_lab" color-lab) (:struct color)
  (l c-float) (a c-float) (b c-float))
(defcfun ("al_color_lab_to_rgb" color-lab-to-rgb) :void
  (l c-float) (a c-float) (b c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_rgb_to_lch" color-rgb-to-lch) :void
  (r c-float) (g c-float) (b c-float)
  (l :pointer) (c :pointer) (h :pointer))
(defcfun ("al_color_lch" color-lch) (:struct color)
  (l c-float) (c c-float) (h c-float))
(defcfun ("al_color_lch_to_rgb" color-lch-to-rgb) :void
  (l c-float) (c c-float) (h c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_color_distance_ciede2000" color-distance-ciede2000) :double
  (color1 (:struct color)) (color2 (:struct color)))
(defcfun ("al_color_rgb_to_yuv" color-rgb-to-yuv) :void
  (red c-float) (green c-float) (blue c-float)
  (y :pointer) (u :pointer) (v :pointer))
(defcfun ("al_color_yuv" color-yuv) (:struct color)
  (y c-float) (u c-float) (v c-float))
(defcfun ("al_color_yuv_to_rgb" color-yuv-to-rgb) :void
  (y c-float) (u c-float) (v c-float)
  (red :pointer) (green :pointer) (blue :pointer))
(defcfun ("al_get_allegro_color_version" get-allegro-color-version) :uint32)
(defcfun ("al_is_color_valid" is-color-valid) :bool (color (:struct color)))
(defcfun ("al_color_rgb_to_oklab" color-rgb-to-oklab) :void
  (red :float) (green :float) (blue :float)
  (ol (:pointer :float)) (oa (:pointer :float)) (ob (:pointer :float)))
(defcfun ("al_color_oklab" color-oklab) (:struct color)
  (l :float) (a :float) (b :float))
(defcfun ("al_color_oklab_to_rgb" color-oklab-to-rgb) :void
  (ol :float) (oa :float) (ob :float)
  (red (:pointer :float)) (green (:pointer :float)) (blue (:pointer :float)))
(defcfun ("al_color_rgb_to_linear" color-rgb-to-linear) :void
  (red :float) (green :float) (blue :float)
  (r (:pointer :float)) (g (:pointer :float)) (b (:pointer :float)))
(defcfun ("al_color_linear" color-linear) (:struct color)
  (r (:pointer :float)) (g (:pointer :float)) (b (:pointer :float)))
(defcfun ("al_color_linear_to_rgb" color-linear-to-rgb) :void
  (r :float) (g :float) (b :float)
  (red (:pointer :float)) (green (:pointer :float)) (blue (:pointer :float)))
