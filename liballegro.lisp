(in-package #:cl-liballegro)

;;; Configuration Files
(defcstruct allegro-config)

(defcfun ("al_create_config" create-config) :pointer)
(defcfun ("al_destroy_config" destroy-config) :void (config :pointer))
(defcfun ("al_load_config_file" load-config-file) :pointer (filename :pointer))
(defcfun ("al_load_config_file_f" load-config-file-f) :pointer (file :pointer))
(defcfun ("al_save_config_file" save-config-file) :boolean
  (filename :pointer) (config :pointer))
(defcfun ("al_save_config_file_f" save-config-file-f) :boolean
  (file :pointer) (config :pointer))
(defcfun ("al_add_config_section" add_config_section) :void
  (config :pointer) (name :pointer))
(defcfun ("al_add_config_comment" add_config_comment) :void
  (config :pointer) (section :pointer) (comment :pointer))
(defcfun ("al_get_config_value" get-config-value) :pointer
  (config :pointer) (section :pointer) (key :pointer))
(defcfun ("al_set_config_value" set-config-value) :void
  (config :pointer) (section :pointer) (key :pointer) (value :pointer))
(defcfun ("al_get_first_config_section" get-first-config-section) :pointer
  (config :pointer) (iterator :pointer))
(defcfun ("al_get_next_config_section" get-next-config-section) :pointer
  (iterator :pointer))
(defcfun ("al_get_first_config_entry" get-first-config-entry) :pointer
  (config :pointer) (section :pointer) (iterator :pointer))
(defcfun ("al_get_next_config_entry" get_next_config_entry) :pointer
  (iterator :pointer))
(defcfun ("al_merge_config" merge-config) :pointer
  (cfg1 :pointer) (cfg2 :pointer))
(defcfun ("al_merge_config_into" merge-config-into) :void
  (master :pointer) (add :pointer))

;;; Display
(defcenum allegro-display-options
  :allegro_red_size
  :allegro_green_size
  :allegro_blue_size
  :allegro_alpha_size
  :allegro_red_shift
  :llegro_green_shift
  :allegro_blue_shift
  :allegro_alpha_shift
  :allegro_acc_red_size
  :allegro_acc_green_size
  :allegro_acc_blue_size
  :allegro_acc_alpha_size
  :allegro_stereo
  :allegro_aux_buffers
  :allegro_color_size
  :allegro_depth_size
  :allegro_stencil_size
  :allegro_sample_buffers
  :allegro_samples
  :allegro_render_method
  :allegro_float_color
  :allegro_float_depth
  :allegro_single_buffer
  :allegro_swap_method
  :allegro_compatible_display
  :allegro_update_display_region
  :allegro_vsync
  :allegro_max_bitmap_size
  :allegro_support_npot_bitmap
  :allegro_can_draw_into_bitmap
  :allegro_support_separate_alpha
  :allegro_display_options_count)

(defcenum allegro-display-orientation
  :allegro-display-orientation-0-degrees
  :allegro-display-orientation-90-degrees
  :allegro-display-orientation-180-degrees
  :allegro-display-orientation-270-degrees
  :allegro-display-orientation-face-up
  :allegro-display-orientation-face-down)

;; Display Creation
(defcstruct allegro-display)

(defcfun ("al_create_display" create-display) :pointer (width :int) (height :int))
(defcfun ("al_destroy_display" destroy-display) :void (display :pointer))
(defcfun ("al_get_new_display_flags" get-new-display-flags) :int)
(defcfun ("al_set_new_display_flags" set-new-display-flags) :void (flags :int))
(defcfun ("al_get_new_display_option" get-new-display-option) :int
  (option allegro-display-options) (importance :pointer))
(defcfun ("al_set_new_display_option" set-new-display-option) :void
  (option allegro-display-options) (value :int) (importance :int))
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

;; Fullscreen display modes
(defcstruct allegro-display-mode
  (width :int)
  (height :int)
  (format :int)
  (refresh-rate :int))

(defcfun ("al_get_display_mode" get-display-mode) :pointer
  (index :int) (mode :pointer))
(defcfun ("al_get_num_display_modes" get-num-display-modes) :int)

;;; Events
(defctype allegro-event-type :uint)

(defcenum (enum :uint)
  ;; Joystick Events
  (:allegro-event-joystick-axis 1)
  :allegro-event-joystick-button-down
  :allegro-event-joystick-button-up
  :allegro-event-joystick-configuration
  ;; Keyboard Events
  (:allegro-event-key-down 10)
  :allegro-event-key-char
  :allegro-event-key-up
  ;; Mouse Events
  (:allegro-event-mouse-axis 20)
  :allegro-event-mouse-button-down
  :allegro-event-mouse-button-up
  :allegro-event-mouse-enter-display
  :allegro-event-mouse-leave-display
  :allegro-event-mouse-warped
  ;; Timer Events
  (:allegro-event-timer 30)
  ;; Display Events
  (:allegro-event-display-expose 40)
  :allegro-event-display-resize
  :allegro-event-display-close
  :allegro-event-display-lost
  :allegro-event-display-found
  :allegro-event-display-switch-in
  :allegro-event-display-switch-out
  :allegro-event-display-orientation)

(defconstant +allegro-event-joystick-axis+ 1)
(defconstant +allegro-event-joystick-button-down+ 2)
(defconstant +allegro-event-joystick-button-up+ 3)
(defconstant +allegro-event-joystick-configuration+ 4)

(defconstant +allegro-event-key-down+ 10)
(defconstant +allegro-event-key-char+ 11)
(defconstant +allegro-event-key-up+ 12)

(defconstant +allegro-event-mouse-axes+ 20)
(defconstant +allegro-event-mouse-button-down+ 21)
(defconstant +allegro-event-mouse-button-up+ 22)
(defconstant +allegro-event-mouse-enter-display+ 23)
(defconstant +allegro-event-mouse-leave-display+ 24)
(defconstant +allegro-event-mouse-warped+ 25)

(defconstant +allegro-event-timer+ 30)

(defconstant +allegro-event-display-expose+ 40)
(defconstant +allegro-event-display-resize+ 41)
(defconstant +allegro-event-display-close+ 42)
(defconstant +allegro-event-display-lost+ 43)
(defconstant +allegro-event-display-found+ 44)
(defconstant +allegro-event-display-switch-in+ 45)
(defconstant +allegro-event-display-switch-out+ 46)
(defconstant +allegro-event-display-orientation+ 47)

(defcstruct allegro-any-event
  (type allegro-event-type) (source :pointer) (timestamp :double))
(defcstruct allegro-display-event
  (type allegro-event-type) (source :pointer) (timestamp :double)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (orientation :int))
(defcstruct allegro-joystick-event
  (type allegro-event-type) (source :pointer) (timestamp :double)
  (id :pointer)
  (stick :int)
  (axis :int)
  (pos :float)
  (button :int))
(defcstruct allegro-keyboard-event
  (type allegro-event-type) (source :pointer) (timestamp :double)
  (display allegro-display)
  (keycode :int)
  (unichar :int)
  (modifiers :uint)
  (repeat :boolean))
(defcstruct allegro-mouse-event
  (type allegro-event-type) (source :pointer) (timestamp :double)
  (display allegro-display)
  (x :int)
  (y :int)
  (z :int)
  (w :int)
  (dx :int)
  (dy :int)
  (dz :int)
  (dw :int)
  (button :uint)
  (pressure :float))
(defcstruct allegro-timer-event
  (type allegro-event-type) (source :pointer) (timestamp :double)
  (count :int64)
  (error :double))
(defcstruct allegro-user-event
  (type allegro-event-type) (source :pointer) (timestamp :double)
  (--internal--descr :pointer) 
  (data1 (:pointer :int))
  (data2 (:pointer :int))
  (data3 (:pointer :int))
  (data4 (:pointer :int)))
(defcunion allegro-event
  (type allegro-event-type)
  (any allegro-any-event)
  (display allegro-display-event)
  (joystick allegro-joystick-event)
  (keyboard allegro-keyboard-event)
  (mouse allegro-mouse-event)
  (timer allegro-timer-event)
  (user allegro-user-event))

(defcstruct (allegro-event-source :size 128))
(defcstruct allegro-event-queue)

(defcfun ("al_create_event_queue" create-event-queue) :pointer)
(defcfun ("al_destroy_event_queue" destroy-event-queue) :void (queue :pointer))
(defcfun ("al_register_event_source" register-event-source) :void
  (queue :pointer) (source :pointer))
(defcfun ("al_unregister_event_source" unregister-event-source) :void
  (queue :pointer) (source :pointer))
(defcfun ("al_is_event_queue_empty" is-event-queue-empty) :boolean (queue :pointer))
(defcfun ("al_get_next_event" get-next-event) :boolean
  (queue :pointer) (ret-event :pointer))
(defcfun ("al_peek_next_event" peek-next-event) :boolean
  (queue :pointer) (ret-event :pointer))
(defcfun ("al_drop_next_event" drop-next-event) :boolean (queue :pointer))
(defcfun ("al_flush_event_queue" flush-event-queue) :void (queue :pointer))
(defcfun ("al_wait_for_event" wait-for-event) :void
  (queue :pointer) (ret-event :pointer))
(defcfun ("al_wait_for_event_timed" wait-for-event-timed) :boolean
  (queue :pointer) (ret-event :pointer) (secs :float))
(defcfun ("al_wait_for_event_until" wait-for-event-until) :boolean
  (queue :pointer) (ret-event :pointer) (timeout :pointer))
(defcfun ("al_init_user_event_source" init-user-event-source) :void (src :pointer))
(defcfun ("al_destroy_user_event_source" destroy-user-event-source) :void
  (src :pointer))
(defcfun ("al_emit_user_event" emit-user-event) :boolean
  (src :pointer) (event :pointer) (dtor :pointer))
(defcfun ("al_unref_user_event" unref-user-event) :void (event :pointer))
(defcfun ("al_get_event_source_data" get-event-source-data) :pointer
  (source :pointer))
(defcfun ("al_set_event_source_data" set-event-source-data) :void
  (source :pointer) (data :pointer))

;;; Graphics
;; Colors
(defcstruct allegro-color (r :float) (g :float) (b :float) (a :float))

;; Bitmap Creation
(defcstruct allegro-bitmap)

(defcfun ("al_create_bitmap" create-bitmap) :pointer (w :int) (h :int))
(defcfun ("al_create_sub_bitmap" create-sub-bitmap) :pointer
  (parent :pointer) (x :int) (y :int) (w :int) (h :int))
(defcfun ("al_clone_bitmap" clone-bitmap) :pointer (bitmap :pointer))
(defcfun ("al_destroy_bitmap" destroy-bitmap) :void (bitmap :pointer))

;; Bitmap Properties

(defcfun ("al_get_bitmap_width" get-bitmap-width) :int (bitmap :pointer))
(defcfun ("al_get_bitmap_height" get-bitmap-height) :int (bitmap :pointer))

;; Drawing Operations
(defcfun ("al_clear_to_color" clear-to-color) :void
  (r :float) (g :float) (b :float) (a :float))
(defcfun ("al_draw_bitmap" draw-bitmap) :void
  (bitmap :pointer) (dx :float) (dy :float) (flags :int))
(defcfun ("al_draw_tinted_bitmap" draw-tinted-bitmap) :void
  (bitmap :pointer)
  (r :float) (g :float) (b :float) (a :float)
  (dx :float) (dy :float)
  (flags :int))

(defcfun ("al_draw_rotated_bitmap" draw-rotated-bitmap) :void
  (bitmap :pointer)
  (cx :float) (cy :float)
  (dx :float) (dy :float)
  (angle :float)
  (flags :int))

;; Images I/O

(defcfun ("al_load_bitmap" load-bitmap) :pointer (filename :pointer))
(defcfun ("al_load_bitmap_f" load-bitmap-f) :pointer (fp :pointer) (ident :pointer))

;;; Keyboard
(defcstruct allegro-keyboard-state)

;; Key codes
(defconstant +allegro-key-a+ 1)
(defconstant +allegro-key-b+ 2)
(defconstant +allegro-key-c+ 3)
(defconstant +allegro-key-d+ 4)
(defconstant +allegro-key-e+ 5)
(defconstant +allegro-key-f+ 6)
(defconstant +allegro-key-g+ 7)
(defconstant +allegro-key-h+ 8)
(defconstant +allegro-key-i+ 9)
(defconstant +allegro-key-j+ 10)
(defconstant +allegro-key-k+ 11)
(defconstant +allegro-key-l+ 12)
(defconstant +allegro-key-m+ 13)
(defconstant +allegro-key-n+ 14)
(defconstant +allegro-key-o+ 15)
(defconstant +allegro-key-p+ 16)
(defconstant +allegro-key-q+ 17)
(defconstant +allegro-key-r+ 18)
(defconstant +allegro-key-s+ 19)
(defconstant +allegro-key-t+ 20)
(defconstant +allegro-key-u+ 21)
(defconstant +allegro-key-v+ 22)
(defconstant +allegro-key-w+ 23)
(defconstant +allegro-key-x+ 24)
(defconstant +allegro-key-y+ 25)
(defconstant +allegro-key-z+ 26)

(defconstant +allegro-key-0+ 27)
(defconstant +allegro-key-1+ 28)
(defconstant +allegro-key-2+ 29)
(defconstant +allegro-key-3+ 30)
(defconstant +allegro-key-4+ 31)
(defconstant +allegro-key-5+ 32)
(defconstant +allegro-key-6+ 33)
(defconstant +allegro-key-7+ 34)
(defconstant +allegro-key-8+ 35)
(defconstant +allegro-key-9+ 36)

(defconstant +allegro-key-pad-0+ 37)
(defconstant +allegro-key-pad-1+ 38)
(defconstant +allegro-key-pad-2+ 39)
(defconstant +allegro-key-pad-3+ 40)
(defconstant +allegro-key-pad-4+ 41)
(defconstant +allegro-key-pad-5+ 42)
(defconstant +allegro-key-pad-6+ 43)
(defconstant +allegro-key-pad-7+ 44)
(defconstant +allegro-key-pad-8+ 45)
(defconstant +allegro-key-pad-9+ 46)

(defconstant +allegro-key-f1+ 47)
(defconstant +allegro-key-f2+ 48)
(defconstant +allegro-key-f3+ 49)
(defconstant +allegro-key-f4+ 50)
(defconstant +allegro-key-f5+ 51)
(defconstant +allegro-key-f6+ 52)
(defconstant +allegro-key-f7+ 53)
(defconstant +allegro-key-f8+ 54)
(defconstant +allegro-key-f9+ 55)
(defconstant +allegro-key-f10+ 56)
(defconstant +allegro-key-f11+ 57)
(defconstant +allegro-key-f12+ 58)

(defconstant +allegro-key-escape+ 59)
(defconstant +allegro-key-tilde+ 60)
(defconstant +allegro-key-minus+ 61)
(defconstant +allegro-key-equals+ 62)
(defconstant +allegro-key-backspace+ 63)
(defconstant +allegro-key-tab+ 64)
(defconstant +allegro-key-openbrace+ 65)
(defconstant +allegro-key-closebrace+ 66)
(defconstant +allegro-key-enter+ 67)
(defconstant +allegro-key-semicolon+ 68)
(defconstant +allegro-key-quote+ 69)
(defconstant +allegro-key-backslash+ 70)
(defconstant +allegro-key-backslash2+ 71)
(defconstant +allegro-key-comma+ 72)
(defconstant +allegro-key-fullstop+ 73)
(defconstant +allegro-key-slash+ 74)
(defconstant +allegro-key-space+ 75)

(defconstant +allegro-key-insert+ 76)
(defconstant +allegro-key-delete+ 77)
(defconstant +allegro-key-home+ 78)
(defconstant +allegro-key-end+ 79)
(defconstant +allegro-key-pgup+ 80)
(defconstant +allegro-key-pgdn+ 81)
(defconstant +allegro-key-left+ 82)
(defconstant +allegro-key-right+ 83)
(defconstant +allegro-key-up+ 84)
(defconstant +allegro-key-down+ 85)

(defconstant +allegro-key-pad-slash+ 86)
(defconstant +allegro-key-pad-asterisk+ 87)
(defconstant +allegro-key-pad-minus+ 88)
(defconstant +allegro-key-pad-plus+ 89)
(defconstant +allegro-key-pad-delete+ 90)
(defconstant +allegro-key-pad-enter+ 91)

(defconstant +allegro-key-printscreen+ 92)
(defconstant +allegro-key-pause+ 93)

(defconstant +allegro-key-modifiers 215)
(defconstant +allegro-key-lshift+ 215)
(defconstant +allegro-key-rshift+ 216)
(defconstant +allegro-key-lctrl+ 217)
(defconstant +allegro-key-rctrl+ 218)
(defconstant +allegro-key-alt+ 219)
(defconstant +allegro-key-altgr+ 220)
(defconstant +allegro-key-lwin+ 221)
(defconstant +allegro-key-rwin+ 222)
(defconstant +allegro-key-menu+ 223)
(defconstant +allegro-key-scrolllock+ 224)
(defconstant +allegro-key-numlock+ 225)
(defconstant +allegro-key-capslock+ 226)

;; Keyboard modifier flags
(defconstant +allegro-keymod-shift+ #x00001)
(defconstant +allegro-keymod-ctrl+ #x00002)
(defconstant +allegro-keymod-alt+ #x00004)
(defconstant +allegro-keymod-lwin+ #x00008)
(defconstant +allegro-keymod-rwin+ #x00010)
(defconstant +allegro-keymod-menu+ #x00020)
(defconstant +allegro-keymod-altgr+ #x00040)
(defconstant +allegro-keymod-command+ #x00080)
(defconstant +allegro-keymod-scrolllock+ #x00100)
(defconstant +allegro-keymod-numlock+ #x00200)
(defconstant +allegro-keymod-capslock+ #x00400)

(defcfun ("al_install_keyboard" install-keyboard) :boolean)
(defcfun ("al_is_keyboard_installed" is-keyboard-installed) :boolean)
(defcfun ("al_uninstall_keyboard" uninstall-keyboard) :void)
(defcfun ("al_get_keyboard_state" get-keyboard-state) :void (ret-state :pointer))
(defcfun ("al_key_down" key-down) :boolean (state :pointer) (keycode :int))
(defcfun ("al_keycode_to_name" keycode-to-name) :pointer (keycode :int))
(defcfun ("al_set_keyboard_leds" set-keyboard-leds) :boolean (leds :int))
(defcfun ("al_get_keyboard_event_source" get-keyboard-event-source) :pointer)

;;; Mouse
(defstruct allegro-mouse-state)

(defcfun ("al_install_mouse" install-mouse) :boolean)
(defcfun ("al_is_mouse_installed" is-mouse-installed) :boolean)
(defcfun ("al_uninstall_mouse" uninstall-mouse) :void)
(defcfun ("al_get_mouse_num_axes" get-mouse-num-axes) :uint)
(defcfun ("al_get_mouse_num_buttons" get-mouse-num-buttons) :uint)
(defcfun ("al_get_mouse_state" get-mouse-state) :void (ret-state :pointer))
(defcfun ("al_get_mouse_state_axis" get-mouse-state-axis) :int
  (state :pointer) (axis :int))
(defcfun ("al_get_mouse_button_down" get-mouse-button-down) :boolean
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

;;; System
(defcfun ("al_install_system" install-system) :boolean
  (version :int) (atexit-ptr :pointer))
(defcfun ("al_get_allegro_version" get-allegro-version) :uint32)
(defun init () (install-system (get-allegro-version) (null-pointer)))
(defcfun ("al_uninstall_system" uninstall-system) :void)
(defcfun ("al_is_system_installed" is-system-installed) :boolean)

;;; Time
(defcstruct allegro-timeout)

(defcfun ("al_get_time" get-time) :double)
(defmacro current-time () `(get-time))
(defcfun ("al_init_timeout" init-timeout) :void (timeout :pointer) (seconds :double))
(defcfun ("al_rest" rest-time) :void (seconds :double))

;;; Timer
(defcstruct allegro-timer)

(defcfun ("al_create_timer" create-timer) :pointer (speed-secs :double))
(defcfun ("al_start_timer" start-timer) :void (timer :pointer))
(defcfun ("al_stop_timer" stop-timer) :void (timer :pointer))
(defcfun ("al_get_timer_started" get-timer-started) :boolean (timer :pointer))
(defcfun ("al_destroy_timer" destroy-timer) :void (timer :pointer))
(defcfun ("al_get_timer_count" get-timer-count) :int64 (timer :pointer))
(defcfun ("al_set_timer_count" set-timer-count) :void
  (timer :pointer) (new-count :int64))
(defcfun ("al_add_timer_count" add-timer-count) :void
  (timer :pointer) (diff :int64))
(defcfun ("al_get_timer_speed" get-timer-speed) :double (timer :pointer))
(defcfun ("al_set_timer_speed" set-timer-speed) :void
  (timer :pointer) (new-speed-secs :double))
(defcfun ("al_get_timer_event_source" get-timer-event-source) :pointer
  (timer :pointer))

;;; Miscellaneous routines
(defconstant +allegro-pi+ 3.14159265358979323846)

;;; Audio addon
;; Setting up audio
(defcfun ("al_install_audio" install-audio) :boolean)
(defcfun ("al_uninstall_audio" uninstall-audio) :void)
(defcfun ("al_is_audio_installed" is-audio-installed) :boolean)
(defcfun ("al_reserve_samples" reserve-samples) :boolean (reserve-samples :int))

;; Sample functions
(defcfun ("al_play_sample" play-sample) :boolean
  (spl :pointer)
  (gain :float) (pan :float) (speed :float)
  (playmode :uint)
  (ret-id :pointer))

;; Audio file I/O
(defcfun ("al_load_sample" load-sample) :pointer (filename :pointer))

;;; Audio codecs addon
(defcfun ("al_init_acodec_addon" init-acodec-addon) :boolean)
(defcfun ("al_get_allegro_acodec_version" get-allegro-acodec-version) :uint32)

;;; Font addons
;; General font routinues
(defconstant +allegro-align-left+ 0)
(defconstant +allegro-align-centre+ 1)
(defconstant +allegro-align-center+ 1)
(defconstant +allegro-align-right+ 2)
(defconstant +allegro-align-integer+ 4)

(defcstruct allegro-font)

(defcfun ("al_init_font_addon" init-font-addon) :void)
(defcfun ("al_shutdown_font_addon" shutdown-font-addon) :void)

(defcfun ("al_draw_text" draw-text) :void
  (font :pointer)
  (r :float) (g :float) (b :float) (a :float)
  (x :float) (y :float)
  (flags :int)
  (ustr :pointer))

;; TTF fonts
(defcfun ("al_init_ttf_addon" init-ttf-addon) :boolean)
(defcfun ("al_shutdown_ttf_addon" shutdown-ttf-addon) :void)
(defcfun ("al_load_ttf_font" load-ttf-font) :pointer
  (filename :pointer) (size :int) (flags :int))
(defcfun ("al_load_ttf_font_f" load-ttf-font-f) :pointer
  (file :pointer) (filename :pointer) (size :int) (flags :int))

;;; Image I/O addon
(defcfun ("al_init_image_addon" init-image-addon) :boolean)
(defcfun ("al_shutdown_image_addon" shutdown-image-addon) :void)
(defcfun ("al_get_allegro_image_version" get-allegro-image-version) :uint32)
