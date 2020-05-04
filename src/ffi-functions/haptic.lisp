(in-package #:cl-liballegro)

(defcfun ("al_install_haptic" install-haptic) :bool)
(defcfun ("al_uninstall_haptic" uninstall-haptic) :void)
(defcfun ("al_is_haptic_installed" is-haptic-installed) :void)
(defcfun ("al_is_mouse_haptic" is-mouse-haptic) :bool (dev :pointer))
(defcfun ("al_is_keyboard_haptic" is-keyboard-haptic) :bool (dev :pointer))
(defcfun ("al_is_display_haptic" is-display-haptic) :bool (dev :pointer))
(defcfun ("al_is_joystick_haptic" is-joystick-haptic) :bool (dev :pointer))
(defcfun ("al_is_touch_input_haptic" is-touch-input-haptic) :bool (dev :pointer))
(defcfun ("al_get_haptic_from_mouse" get-haptic-from-mouse) (:pointer (:struct haptic))
  (dev :pointer))
(defcfun ("al_get_haptic_from_keyboard" get-haptic-from-keyboard) (:pointer (:struct haptic))
  (dev :pointer))
(defcfun ("al_get_haptic_from_display" get-haptic-from-display) (:pointer (:struct haptic))
  (dev :pointer))
(defcfun ("al_get_haptic_from_joystick" get-haptic-from-joystick) (:pointer (:struct haptic))
  (dev :pointer))
(defcfun ("al_get_haptic_from_touch_input" get-haptic-from-touch-input) (:pointer (:struct haptic))
  (dev :pointer))
(defcfun ("al_release_haptic" release-haptic) :bool (hap (:pointer (:struct haptic))))
(defcfun ("al_is_haptic_active" is-haptic-active) :bool (hap (:pointer (:struct haptic))))
(defcfun ("al_get_haptic_capabilities" get-haptic-capabilities) :int (hap (:pointer (:struct haptic))) )
(defcfun ("al_is_haptic_capable" is-haptic-capable) :bool
  (hap (:pointer (:struct haptic))) (query :int))
(defcfun ("al_set_haptic_gain" set-haptic-gain) :bool
  (hap (:pointer (:struct haptic))) (gain :double))
(defcfun ("al_get_haptic_gain" get-haptic-gain) :double (hap (:pointer (:struct haptic))))
(defcfun ("al_set_haptic_autocenter" set-haptic-autocenter) :bool
  (hap (:pointer (:struct haptic))) (intensity :double))
(defcfun ("al_get_haptic_autocenter" get-haptic-autocenter) :double
  (hap (:pointer (:struct haptic))))
(defcfun ("al_get_max_haptic_effects" get-max-haptic-effects) :int
  (hap (:pointer (:struct haptic))))
(defcfun ("al_is_haptic_effect_ok" is-haptic-effect-ok) :bool
  (hap (:pointer (:struct haptic))) (effect (:pointer (:struct haptic-effect))))
(defcfun ("al_upload_haptic_effect" upload-haptic-effect) :bool
  (hap (:pointer (:struct haptic))) (effect (:pointer (:struct haptic-effect)))
  (id (:pointer (:struct haptic-effect-id))))
(defcfun ("al_play_haptic_effect" play-haptic-effect) :bool
  (id (:pointer (:struct haptic-effect-id))) (loop :int))
(defcfun ("al_upload_and_play_haptic_effect" upload-and-play-haptic-effect) :bool
  (hap (:pointer (:struct haptic))) (effect (:pointer (:struct haptic-effect)))
  (id (:pointer (:struct haptic-effect-id))) (loop :int))
(defcfun ("al_stop_haptic_effect" stop-haptic-effect) :bool
  (id (:pointer (:struct haptic-effect-id))))
(defcfun ("al_is_haptic_effect_playing" is-haptic-effect-playing) :bool
  (id (:pointer (:struct haptic-effect-id))))
(defcfun ("al_get_haptic_effect_duration" get-haptic-effect-duration) :double
  (effect (:pointer (:struct haptic-effect))))
(defcfun ("al_release_haptic_effect" release-haptic-effect) :bool
  (id (:pointer (:struct haptic-effect-id))))
(defcfun ("al_rumble_haptic" rumble-haptic) :bool
  (hap (:pointer (:struct haptic)))
  (intensity :double)
  (duration :double)
  (id (:pointer (:struct haptic-effect-id))))
