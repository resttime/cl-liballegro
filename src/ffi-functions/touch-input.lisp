(in-package #:cl-liballegro)

;; Touch input
(defcfun ("al_install_touch_input" install-touch-input) :bool)
(defcfun ("al_uninstall_touch_input" uninstall-touch-input) :void)
(defcfun ("al_is_touch_input_installed" is-touch-input-installed) :bool)
(defcfun ("al_get_touch_input_state" get-touch-input-state) :void
  (ret-state :pointer))
(defcfun ("al_set_mouse_emulation_mode" set-mouse-emulation-mode) :void
  (mode :int))
(defcfun ("al_get_mouse_emulation_mode" get-mouse-emulation-mode) :int)
(defcfun ("al_get_touch_input_event_source" get-touch-input-event-source) :pointer)
(defcfun ("al_get_touch_input_mouse_emulation_event_source" get-touch-input-mouse-emulation-event-source) :pointer)
