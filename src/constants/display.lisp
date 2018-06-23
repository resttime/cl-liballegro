(in-package :cl-liballegro)

;; Flags
(defbitfield display-flags
  :windowed
  :fullscreen
  :opengl
  :direct3d-internal
  :resizable
  :frameless
  (:noframe 32)
  :generate-expose-events
  :opengl-3-0
  :opengl-forward-compatible
  :fullscreen-window
  :minimized
  :programmable-pipeline
  :gtk-toplevel-internal
  :maximized
  :opengl-es-profile)

;; Display Options
(defcenum display-options
  :red-size
  :green-size
  :blue-size
  :alpha-size
  :red-shift
  :green-shift
  :blue-shift
  :alpha-shift
  :acc-red-size
  :acc-green-size
  :acc-blue-size
  :acc-alpha-size
  :stereo
  :aux-buffers
  :color-size
  :depth-size
  :stencil-size
  :sample-buffers
  :samples
  :render-method
  :float-color
  :float-depth
  :single-buffer
  :swap-method
  :compatible-display
  :update-display-region
  :vsync
  :max-bitmap-size
  :support-npot-bitmap
  :can-draw-into-bitmap
  :support-separate-alpha
  :auto-convert-bitmaps
  :supported-orientations
  :opengl-major-version
  :opengl-minor-version
  :display-options-count)

;; Importance
(defcenum importance
  :dontcare
  :require
  :suggest)

;; Display Orientation
(defcenum display-orientation
  (:unknown 0)
  (:0-degrees 1)
  (:90-degrees 2)
  (:180-degrees 4)
  (:270-degrees 8)
  (:portrait 5)
  (:landscape 10)
  (:all 15)
  (:face-up 16)
  (:face-down 32))

(defconstant +new-window-title-max-size+ 255)
