(in-package #:cl-liballegro)

(defcstruct haptic)

(defcstruct haptic-direction
  (angle :double)
  (radius :double)
  (azimuth :double))
(defcstruct haptic-replay
  (length :double)
  (delay :double))
(defcstruct haptic-envelope
  (attack-length :double)
  (attack-level :double)
  (fade-length :double)
  (fade-level :double))

(defcstruct haptic-constant-effect
  (level :double)
  (envelope (:struct haptic-envelope)))
(defcstruct haptic-ramp-effect
  (start-level :double)
  (end-level :double)
  (envelope (:struct haptic-envelope)))
(defcstruct haptic-condition-effect
  (right-saturation :double)
  (left-saturation :double)
  (right-coeff :double)
  (left-coeff :double)
  (deadband :double)
  (center :double))
(defcstruct haptic-periodic-effect
  (waveform :int)
  (period :double)
  (magnitude :double)
  (offset :double)
  (phase :double)

  (envelope (:struct haptic-envelope))
  (custom-len :int)
  (custom-data (:pointer :double)))
(defcstruct haptic-rumble-effect
  (strong-magnitude :double)
  (weak-magnitude :double))
(defcunion haptic-effect-union
  (constant (:struct haptic-constant-effect))
  (ramp (:struct haptic-ramp-effect))
  (periodic (:struct haptic-periodic-effect))
  (condition (:struct haptic-condition-effect))
  (rumble (:struct haptic-rumble-effect)))

(defcstruct haptic-effect
  (type :int)
  (direction (:struct haptic-direction))
  (replay (:struct haptic-replay))
  (data (:union haptic-effect-union)))
(defcstruct haptic-effect-id
  (-haptic :pointer)
  (-id :int)
  (-handle :int)
  (-pointer :pointer)
  (-effect-duration :double)
  (-playing :bool)
  (-start-time :double)
  (-end-time :double)
  (driver :pointer))
