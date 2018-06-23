(in-package #:cl-liballegro)

;; Colors
(defcstruct color
  (r :float)
  (g :float)
  (b :float)
  (a :float))

;; Locking and Pixel Formats
(defcstruct locked-region
  (data :pointer)
  (format :int)
  (pitch :int)
  (pixel-size :int))

;; Bitmap Creation
(defcstruct bitmap
  (vt :pointer)
  (display :pointer)
  (format :int)
  (flags :int)
  (w :int)
  (h :int)
  (pitch :int)
  (cl :int)
  (cr-excl :int)
  (ct :int)
  (cb-excl :int)
  (locked :boolean)
  (lock-x :int)
  (lock-y :int)
  (lock-w :int)
  (lock-h :int)
  (lock-flags :int)
  ;(locked-region locked-region)
  ;(transform transform)
  (parent :pointer)
  (xofs :int)
  (yofs :int)
  (memory :pointer)
  (size :uint)
  (preserve-texture :boolean))

