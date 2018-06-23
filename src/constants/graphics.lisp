(in-package :cl-liballegro)

;; Bitmap flags
(defbitfield bitmap-flags
  (:memory-bitmap #x0001)
  (:keep-bitmap-format #x0002)
  (:force-locking #x0004)
  (:no-preserve-texture #x0008)
  (:alpha-test #x0010)
  (:internal-opengl #x0020)
  (:min-linear #x0040)
  (:mag-linear #x0080)
  (:mipmap #x0100)
  (:no-premultiplied-alpha #x0200)
  (:video-bitmap #x0400)
  (:convert-bitmap #x1000))

;; Loader flags
(defbitfield bitmap-loader-flags
  (:keep-bitmap-format #x0002)
  (:no-premultiplied-alpha #x0200)
  (:keep-index #x0800))

;; Flags for blitting functions
(defbitfield draw-flags
  (:flip-horizontal #x00001)
  (:flip-vertical #x00002))
;; Locking flags
(defcenum locking-flags
  :readwrite
  :readonly
  :writeonly)
;; Locking and pixel formats
(defcenum pixel-format
  (:any 0)
  :any-no-alpha
  :any-with-alpha
  :any-15-no-alpha
  :any-16-no-alpha
  :any-16-with-alpha
  :any-24-no-alpha
  :any-32-no-alpha
  :any-32-with-alpha
  :argb-8888
  :rgba-8888
  :argb-4444
  :rgb-888
  :rgb-565
  :rgb-555
  :rgba-5551
  :argb-1555
  :abgr-8888
  :xbgr-8888
  :bgr-888
  :bgr-565
  :bgr-555
  :rgbx-8888
  :xrgb-8888
  :abgr-f32
  :abgr-8888-le
  :rgba-4444
  :single-channel-8
  :compressed-rgba-dxt1
  :compressed-rgba-dxt3
  :compressed-rgba-dxt5
  :num-pixel-formats)
(defcenum blend-mode
  :zero
  :one
  :alpha
  :inverse-alpha
  :src-color
  :dest-color
  :inverse-src-color
  :inverse-dest-color
  :const-color
  :inverse-cons-color
  :num-blend-modes)
(defcenum blend-operations
  :add
  :src-minus-dest
  :dest-minus-src
  :num-blend-operations)

(defcenum render-state
  (:alpha-test #x0010)
  :write-mask
  :depth-test
  :depth-function
  :alpha-function
  :alpha-test-value)

(defcenum render-function
  :never
  :always
  :less
  :equal
  :less-equal
  :greater
  :not-equal
  :greater-equal)

(defbitfield write-mask-flags
  :red
  :green
  :blue
  :alpha
  :depth
  (:rgb #x0007) ; RED | GREEN | BLUE
  (:rgba #x000F)) ; RGB | ALPHA
