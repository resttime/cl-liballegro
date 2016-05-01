(in-package #:cl-liballegro)

;;; Display
;; Display Creation
(defcfun ("al_create_display" create-display) :pointer (width :int) (height :int))
(defcfun ("al_destroy_display" destroy-display) :void (display :pointer))
(defcfun ("al_get_new_display_flags" get-new-display-flags) display-flags)
(defcfun ("al_set_new_display_flags" set-new-display-flags) :void (flags display-flags))
(defcfun ("al_get_new_display_option" get-new-display-option) :int
  (option display-options) (importance :pointer))
(defcfun ("al_set_new_display_option" set-new-display-option) :void
  (option display-options) (value :int) (importance importance))
(defcfun ("al_reset_new_display_options" reset-new-display-options) :void)
(defcfun ("al_get_new_window_position" get-new-window-position) :void
  (x :pointer) (y :pointer))
(defcfun ("al_set_new_window_position" set-new-window-position) :void
  (x :int) (y :int))
(defcfun ("al_get_new_display_refresh_rate" get-new-display-refresh-rate) :int)
(defcfun ("al_set_new_display_refresh_rate" set-new-display-refresh-rate) :void
  (refresh-rate :int))


;; Display Operations
(defcfun ("al_get_display_event_source" get-display-event-source) :pointer
  (display :pointer))
(defcfun ("al_get_backbuffer" get-backbuffer) :pointer (display :pointer))
(defcfun ("al_flip_display" flip-display) :void) 
(defcfun ("al_update_display_region" update-display-region) :void
  (x :int) (y :int) (width :int) (height :int))
(defcfun ("al_wait_for_vsync" wait-for-vsync) :boolean)

;; Display size and position
(defcfun ("al_get_display_width" get-display-width) :int (display :pointer))
(defcfun ("al_get_display_height" get-display-height) :int (display :pointer))
(defcfun ("al_resize_display" resize-display) :boolean
  (display :pointer) (width :int) (height :int))
(defcfun ("al_acknowledge_resize" acknowledge-resize) :boolean (display :pointer))
(defcfun ("al_get_window_position" get-window-position) :void
  (display :pointer) (x :pointer) (y :pointer))
(defcfun ("al_set_window_position" set-window-position) :void
  (display :pointer) (x :int) (y :int))
(defcfun ("al_get_window_constraints" get-window-constraints) :bool
  (display :pointer) (min-w :pointer) (min-h :pointer) (max-w :pointer) (max-h :pointer))
(defcfun ("al_set_window_constraints" set-window-constraints) :bool
  (display :pointer) (min-w :pointer) (min-h :pointer) (max-w :pointer) (max-h :pointer))

;; Display settings
(defcfun ("al_get_display_flags" get-display-flags) display-flags (display :pointer))
(defcfun ("al_set_display_flag" set-display-flag) :boolean
  (display :pointer) (flag display-flags) (onoff :boolean))
(defcfun ("al_get_display_option" get-display-option) :int
  (display :pointer) (option display-options))
(defcfun ("al_set_display_option" set-display-option) :void
  (display :pointer) (option display-options) (value :int))
(defcfun ("al_get_display_format" get-display-format) pixel-format (display :pointer))
(defcfun ("al_get_display_refresh_rate" get-display-refresh-rate) :int
  (display :pointer))
(defcfun ("al_get_display_orientation" get-display-orientation) display-orientation
  (display :pointer))
(defcfun ("al_set_window_title" set-window-title) :void
  (display :pointer) (title :string))
(defcfun ("al_set_new_window_title" set-new-window-title) :void
  (title :string))
(defcfun ("al_get_new_window_title" get-new-window-title) :string)
(defcfun ("al_set_display_icon" set-display-icon) :void
  (display :pointer) (icon :pointer))
(defcfun ("al_set_display_icons" set-display-icons) :void
  (display :pointer) (num-icons :int) (icons :pointer))

;; Drawing halts
(defcfun ("al_acknowledge_drawing_halt" acknowledge-drawing-halt) :void (display :pointer))
(defcfun ("al_acknowledge_drawing_resume" acknowledge-drawing-resume) :void (display :pointer))

;; Screensaver
(defcfun ("al_inhibit_screensaver" inhibit-screensaver) :boolean (inhibit :boolean))

;; Clipboard
(defcfun ("al_get_clipboard_text" get-clipboard-text) :string (display :pointer))
(defcfun ("al_set_clipboard_text" set-clipboard-text) :bool (display :pointer) (text :string))
(defcfun ("al_clipboard_has_text" clipboard-has-text) :bool (display :pointer))
