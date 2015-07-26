(in-package #:cl-liballegro)

;;; Joystick
(defcfun ("al_install_joystick" install-joystick) :boolean)
(defcfun ("al_uninstall_joystick" uninstall-joystick) :void)
(defcfun ("al_is_joystick_installed" is-joystick-installed) :boolean)
(defcfun ("al_reconfigure_joysticks" reconfigure-joysticks) :boolean)
(defcfun ("al_get_num_joysticks" get-num-joysticks) :int)
(defcfun ("al_get_joystick" get-joystick) :pointer (num :int))
(defcfun ("al_release_joystick" release-joystick) :void (joy :pointer))
(defcfun ("al_get_joystick_active" get-joystick-active) :boolean (joy :pointer))
(defcfun ("al_get_joystick_name" get-joystick-name) :string (joy :pointer))
(defcfun ("al_get_joystick_stick_name" get-joystick-stick-name) :string
  (joy :pointer) (stick :int))
(defcfun ("al_get_joystick_axis_name" get-joystick-axis-name) :string
  (joy :pointer) (stick :int) (axis :int))
(defcfun ("al_get_joystick_button_name" get-joystick-button-name) :string
  (joy :pointer) (button :int))
(defcfun ("al_get_joystick_stick_flags" get-joystick-stick-flags) :int
  (joy :pointer) (stick joyflags))
(defcfun ("al_get_joystick_num_sticks" get-joystick-num-sticks) :int (joy :pointer))
(defcfun ("al_get_joystick_num_axes" get-joystick-num-axes) :int
  (joy :pointer) (stick :int))
(defcfun ("al_get_joystick_num_buttons" get-joystick-num-buttons) :int
  (joy :pointer))
(defcfun ("al_get_joystick_state" get-joystick-state) :void
  (joy :pointer) (ret-state :pointer))
(defcfun ("al_get_joystick_event_source" get-joystick-event-source) :pointer)
