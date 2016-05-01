(in-package #:cl-liballegro)

;;; Mouse
(defcfun ("al_install_mouse" install-mouse) :boolean)
(defcfun ("al_is_mouse_installed" is-mouse-installed) :boolean)
(defcfun ("al_uninstall_mouse" uninstall-mouse) :void)
(defcfun ("al_get_mouse_num_axes" get-mouse-num-axes) :uint)
(defcfun ("al_get_mouse_num_buttons" get-mouse-num-buttons) :uint)
(defcfun ("al_get_mouse_state" get-mouse-state) :void (ret-state :pointer))
(defcfun ("al_get_mouse_state_axis" get-mouse-state-axis) :int
  (state :pointer) (axis :int))
(defcfun ("al_mouse_button_down" mouse-button-down) :boolean
  (state :pointer) (button :int))
(defcfun ("al_set_mouse_xy" set-mouse-xy) :boolean
  (display :pointer) (x :int) (y :int))
(defcfun ("al_set_mouse_z" set-mouse-z) :boolean
  (z :int))
(defcfun ("al_set_mouse_w" set-mouse-w) :boolean
  (w :int))
(defcfun ("al_set_mouse_axis" set-mouse-axis) :boolean (which :int) (value :int))
(defcfun ("al_get_mouse_event_source" get-mouse-event-source) :pointer)

;; Mouse cursors
(defcfun ("al_create_mouse_cursor" create-mouse-cursor) :pointer
  (bmp :pointer) (x_focus :int) (y_focus :int))
(defcfun ("al_destroy_mouse_cursor" destroy-mouse-cursor) :void (cursor :pointer))
(defcfun ("al_set_mouse_cursor" set-mouse-cursor) :boolean
  (display :pointer) (cursor :pointer))
(defcfun ("al_set_system_mouse_cursor" set-system-mouse-cursor) :boolean
  (display :pointer) (cursor-id system-mouse-cursor))
(defcfun ("al_get_mouse_cursor_position" get-mouse-cursor-position) :boolean
  (ret-x :pointer) (ret-y :pointer))
(defcfun ("al_hide_mouse_cursor" hide-mouse-cursor) :boolean (display :pointer))
(defcfun ("al_show_mouse_cursor" show-mouse-cursor) :boolean (display :pointer))
(defcfun ("al_grab_mouse" grab-mouse) :boolean (display :pointer))
(defcfun ("al_ungrab_mouse" ungrab-mouse) :boolean)
