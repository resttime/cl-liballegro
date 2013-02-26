(in-package #:cl-liballegro)

;;; Configuration Files
(defcfun ("al_create_config" create-config) :pointer)
(defcfun ("al_destroy_config" destroy-config) :void (config :pointer))
(defcfun ("al_load_config_file" load-config-file) :pointer (filename :string))
(defcfun ("al_load_config_file_f" load-config-file-f) :pointer (file :pointer))
(defcfun ("al_save_config_file" save-config-file) :boolean
  (filename :string) (config :pointer))
(defcfun ("al_save_config_file_f" save-config-file-f) :boolean
  (file :pointer) (config :pointer))
(defcfun ("al_add_config_section" add_config_section) :void
  (config :pointer) (name :string))
(defcfun ("al_add_config_comment" add_config_comment) :void
  (config :pointer) (section :string) (comment :string))
(defcfun ("al_get_config_value" get-config-value) :string
  (config :pointer) (section :string) (key :string))
(defcfun ("al_set_config_value" set-config-value) :void
  (config :pointer) (section :string) (key :string) (value :string))
(defcfun ("al_get_first_config_section" get-first-config-section) :string
  (config :pointer) (iterator :pointer))
(defcfun ("al_get_next_config_section" get-next-config-section) :string
  (iterator :pointer))
(defcfun ("al_get_first_config_entry" get-first-config-entry) :string
  (config :pointer) (section :string) (iterator :pointer))
(defcfun ("al_get_next_config_entry" get_next_config_entry) :pointer
  (iterator :pointer))
(defcfun ("al_merge_config" merge-config) :pointer
  (cfg1 :pointer) (cfg2 :pointer))
(defcfun ("al_merge_config_into" merge-config-into) :void
  (master :pointer) (add :pointer))

;;; Display
;; Display Creation
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

;; Display settings
(defcfun ("al_get_display_flags" get-display-flags) :int (display :pointer))
(defcfun ("al_get_display_flag" get-display-flag) :boolean
  (display :pointer) (flag :int) (onoff :boolean))
(defcfun ("al_toggle_display_flag" toggle-display-flag) :boolean
  (display :pointer) (flag :int) (onoff :boolean))
(defcfun ("al_get_display_option" get-display-option) :int
  (display :pointer) (option allegro-display-options))
(defcfun ("al_get_display_format" get-display-format) :int (display :pointer))
(defcfun ("al_get_display_refresh_rate" get-display-refresh-rate) :int
  (display :pointer))
(defcfun ("al_set_window_title" set-window-title) :void
  (display :pointer) (title :string))
(defcfun ("al_set_display_icon" set-display-icon) :void
  (display :pointer) (icon :pointer))
(defcfun ("al_set_display_icons" set-display-icons) :void
  (display :pointer) (num-icons :int) (icon :pointer))

;; Screensaver
(defcfun ("al_inhibit_screensaver" inhibit-screensaver) :boolean (inhibit :boolean))

;;; Events
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
  (queue :pointer) (ret-event :pointer) (secs c-float))
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

;;; File I/O
(defcfun ("al_fopen" fopen) :pointer (path :pointer) (mode :pointer))

;;; File system routines
(defcfun ("al_create_fs_entry" create-fs-entry) :pointer (path :pointer))
(defcfun ("al_destroy_fs_entry" destroy-fs-entry) :void (fh :pointer))

;;; Fixed point math
(defctype fixed :int32)

(defcfun ("al_itofix" itofix) fixed (x :int))
(defcfun ("al_fixtoi" fixtoi) :int (x fixed))
(defcfun ("al_fixfloor" fixfloor) :int (x fixed))
(defcfun ("al_fixceil" fixceil) :int (x fixed))
(defcfun ("al_ftofix" ftofix) fixed (x c-double))
(defcfun ("al_fixtof" fixtof) c-double (x fixed))
(defcfun ("al_fixmul" fixmul) fixed (x fixed) (y fixed))
(defcfun ("al_fixdiv" fixdiv) fixed (x fixed) (y fixed))
(defcfun ("al_fixadd" fixadd) fixed (x fixed) (y fixed))
(defcfun ("al_fixsub" fixsub) fixed (x fixed) (y fixed))

;; Fixed point trig
(defcfun ("al_fixsin" fixsin) fixed (x fixed))
(defcfun ("al_fixcos" fixcos) fixed (x fixed))
(defcfun ("al_fixtan" fixtan) fixed (x fixed))
(defcfun ("al_fixasin" fixasin) fixed (x fixed))
(defcfun ("al_fixacos" fixacos) fixed (x fixed))
(defcfun ("al_fixatan" fixatan) fixed (x fixed))
(defcfun ("al_fixatan2" fixatan2) fixed (y fixed) (x fixed))
(defcfun ("al_fixsqrt" fixsqrt) fixed (x fixed))
(defcfun ("al_fixhypot" fixhypot) fixed (x fixed) (y fixed))

;;; Fullscreen modes
(defcfun ("al_get_display_mode" get-display-mode) :pointer
  (index :int) (mode :pointer))
(defcfun ("al_get_num_display_modes" get-num-display-modes) :int)

;;; Graphics
;; Colors

;; Locking and pixel formats
(defcfun ("al_get_pixel_size" get-pixel-size) :int (format allegro-pixel-format))
(defcfun ("al_get_pixel_format_bits" get-pixel-format-bits) :int
  (format allegro-pixel-format))
(defcfun ("al_lock_bitmap" lock-bitmap) :pointer
  (bitmap :pointer) (format allegro-pixel-format) (flags :int))
(defcfun ("al_lock_bitmap_region" lock-bitmap-region) :pointer
  (bitmap :pointer) (x :int) (y :int) (widht :int) (height :int)
  (format allegro-pixel-format) (flags :int))
(defcfun ("al_unlock_bitmap" unlock-bitmap) :void (bitmap :pointer))

;; Bitmap Creation
(defcfun ("al_create_bitmap" create-bitmap) :pointer (w :int) (h :int))
(defcfun ("al_create_sub_bitmap" create-sub-bitmap) :pointer
  (parent :pointer) (x :int) (y :int) (w :int) (h :int))
(defcfun ("al_clone_bitmap" clone-bitmap) :pointer (bitmap :pointer))
(defcfun ("al_destroy_bitmap" destroy-bitmap) :void (bitmap :pointer))
(defcfun ("al_get_new_bitmap_flags" get-new-bitmap-flags) :int)
(defcfun ("al_get_new_bitmap_format" get-new-bitmap-format) :int)
(defcfun ("al_set_new_bitmap_flags" set-new-bitmap-flags) :void (flags :int))
(defcfun ("al_add_new_bitmap_flag" add-new-bitmap-flag) :void (flag :int))
(defcfun ("al_set_new_bitmap_format" set-new-bitmap-format) :void
  (allegro-pixel-format :int))


;; Bitmap properties
(defcfun ("al_get_bitmap_flags" get-bitmap-flags) :int (bitmap :pointer))
(defcfun ("al_get_bitmap_format" get-bitmap-format) :int (bitmap :pointer))
(defcfun ("al_get_bitmap_height" get-bitmap-height) :int (bitmap :pointer))
(defcfun ("al_get_bitmap_width" get-bitmap-width) :int (bitmap :pointer))

(defcfun ("al_is_bitmap_locked" is-bitmap-locked) :boolean (bitmap :pointer))
(defcfun ("al_is_compatible_bitmap" is-compatible-bitmap) :boolean (bitmap :pointer))
(defcfun ("al_is_sub_bitmap" is-sub-bitmap) :boolean (bitmap :pointer))
(defcfun ("al_get_parent_bitmap" get-parent-bitmap) :pointer (bitmap :pointer))

;; Drawing Operations
(defcfun ("al_clear_to_color" clear-to-color) :void
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_draw_bitmap" draw-bitmap) :void
  (bitmap :pointer) (dx c-float) (dy c-float) (flags :int))
(defcfun ("al_draw_tinted_bitmap" draw-tinted-bitmap) :void
  (bitmap :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (dx c-float) (dy c-float)
  (flags :int))
(defcfun ("al_draw_bitmap_region" draw-bitmap-region) :void
  (bitmap :pointer)
  (sx c-float) (sy c-float) (sw c-float) (sh c-float) (dx c-float (dy c-float))
  (flags :int))
(defcfun ("al_draw_tinted_bitmap_region" draw-tinted-bitmap-region) :void
  (bitmap :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (sx c-float) (sy c-float) (sw c-float) (sh c-float) (dx c-float (dy c-float))
  (flags :int))
(defcfun ("al_draw_pixel" draw-pixel) :void
  (x c-float) (y c-float)
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_draw_rotated_bitmap" draw-rotated-bitmap) :void
  (bitmap :pointer)
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (angle c-float)
  (flags :int))
(defcfun ("al_draw_tinted_rotated_bitmap" draw-tinted-rotated-bitmap) :void
  (bitmap :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (angle c-float)
  (flags :int))
(defcfun ("al_draw_scaled_rotated_bitmap" draw-scaled-rotated-bitmap) :void
  (bitmap :pointer)
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (xscale c-float) (yscale c-float)
  (angle c-float)
  (flags :int))
(defcfun ("al_draw_tinted_scaled_rotated_bitmap" draw-tinted-scaled-rotated-bitmap)
    :void
  (bitmap :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (xscale c-float) (yscale c-float)
  (angle c-float)
  (flags :int))
(defcfun ("al_draw_tinted_scaled_rotated_bitmap_region"
	  draw-tinted-scaled-rotated-bitmap-region) :void
  (sx c-float) (sy c-float) (sw c-float) (sh c-float)
  (bitmap :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (xscale c-float) (yscale c-float)
  (angle c-float)
  (flags :int))
(defcfun ("al_draw_scaled_bitmap" draw-scaled-bitmap) :void
  (sx c-float) (sy c-float) (sw c-float) (sh c-float)
  (dx c-float) (dy c-float) (dw c-float) (dh c-float)
  (flags :int))
(defcfun ("al_draw_tinted_scaled_bitmap" draw-tinted-scaled-bitmap) :void
  (r c-float) (g c-float) (b c-float) (a c-float)
  (sx c-float) (sy c-float) (sw c-float) (sh c-float)
  (dx c-float) (dy c-float) (dw c-float) (dh c-float)
  (flags :int))
(defcfun ("al_get_target_bitmap" get-target-bitmap) :pointer)
(defcfun ("al_put_pixel" put-pixel) :void
  (x :int) (y :int)
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_put_blended_pixel" put-blended-pixel) :void
  (x :int) (y :int)
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_set_target_bitmap" set-target-bitmap) :void (bitmap :pointer))
(defcfun ("al_set_target_backbuffer" set-target-backbuffer) :void (display :pointer))
(defcfun ("al_get_current_display" get-current-display) :pointer)

;; Blending modes
(defcfun ("al_get_blender" get-blender) :void
  (op :pointer) (src :pointer) (dst :pointer))
(defcfun ("al_get_separate_blender" get-separate-blender) :void
  (op :pointer) (src :pointer) (dst :pointer)
  (alpha-op :pointer) (alpha-src :pointer) (alpha-dst :pointer))
(defcfun ("al_set_blender" set-blender) :void
  (op :int) (src :int) (dst :int))
(defcfun ("al_set_separate_blender" set-separate-blender) :void
  (op :int) (src :int) (dst :int)
  (alpha-op :int) (alpha-src :int) (alpha-dst :int))

;; Clipping
(defcfun ("al_get_clipping_rectangle" get-clipping-rectangle) :void
  (x :pointer) (y :pointer) (w :pointer) (h :pointer))
(defcfun ("al_set_clipping_rectangle" set-clipping-rectangle) :void
  (x :int) (y :int) (w :int) (h :int))
(defcfun ("al_reset_clipping_rectangle" reset-clipping-rectangle) :void)

;; Graphics utility functions
(defcfun ("al_convert_mask_to_alpha" convert-mask-to-alpha) :void
  (bitmap :pointer) (r c-float) (g c-float) (b c-float) (a c-float))

;; Deferred drawing
(defcfun ("al_hold_bitmap_drawing" hold-bitmap-drawing) :void (hold :boolean))
(defcfun ("al_is_bitmap_drawing_held" is-bitmap-drawing-held) :boolean)

;; Images I/O
(defcfun ("al_register_bitmap_loader" register-bitmap-loader) :boolean
  (extension :string) (loader :pointer))
(defcfun ("al_register_bitmap_saver" register-bitmap-saver) :boolean
  (extension :string) (saver :boolean))
(defcfun ("al_register_bitmap_loader_f" register-bitmap-loader-f) :boolean
  (extension :string) (loader-f :pointer))
(defcfun ("al_register_bitmap_saver_f" register-bitmap-saver-f) :boolean
  (extension :string) (loader-f :pointer))
(defcfun ("al_load_bitmap" load-bitmap) :pointer (filename :string))
(defcfun ("al_load_bitmap_f" load-bitmap-f) :pointer (fp :pointer) (ident :string))
(defcfun ("al_save_bitmap" save-bitmap) :boolean
  (filename :string) (bitmap :pointer))
(defcfun ("al_save_bitmap_f" save-bitmap-f) :boolean
  (fp :pointer) (ident :string) (bitmap :pointer))

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
  (joy :pointer) (stick :int))
(defcfun ("al_get_joystick_num_sticks" get-joystick-num-sticks) :int (joy :pointer))
(defcfun ("al_get_joystick_num_axes" get-joystick-num-axes) :int
  (joy :pointer) (stick :int))
(defcfun ("al_get_joystick_num_buttons" get-joystick-num-buttons) :int
  (joy :pointer))
(defcfun ("al_get_joystick_state" get-joystick-state) :void
  (joy :pointer) (ret-state :pointer))
(defcfun ("al_get_joystick_event_source" get-joystick-event-source) :pointer)

;;; Keyboard
(defcfun ("al_install_keyboard" install-keyboard) :boolean)
(defcfun ("al_is_keyboard_installed" is-keyboard-installed) :boolean)
(defcfun ("al_uninstall_keyboard" uninstall-keyboard) :void)
(defcfun ("al_get_keyboard_state" get-keyboard-state) :void (ret-state :pointer))
(defcfun ("al_key_down" key-down) :boolean (state :pointer) (keycode :int))
(defcfun ("al_keycode_to_name" keycode-to-name) :string (keycode :int))
(defcfun ("al_set_keyboard_leds" set-keyboard-leds) :boolean (leds :int))
(defcfun ("al_get_keyboard_event_source" get-keyboard-event-source) :pointer)

;;; ??? Memory ???

;;; Monitor
(defcfun ("al_get_new_display_adapter" get-new-display-adapter) :int)
(defcfun ("al_set_new_display_adapter" set-new-display-adapter) :void (adapter :int))
(defcfun ("al_get_monitor_info" get-monitor-info) :boolean
  (adapter :int) (info :pointer))
(defcfun ("al_get_num_video_adapters" get-num-video-adapters) :int)

;;; Mouse
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
(defcfun ("al_destroy_mouse_cursor" destroy-mouse-cursor) :void (cursor :pointer))
(defcfun ("al_set_mouse_cursor" set-mouse-cursor) :boolean
  (display :pointer) (cursor :pointer))
(defcfun ("al_set_system_mouse_cursor" set-system-mouse-cursor) :boolean
  (display :pointer) (cursor-id allegro-system-mouse-cursor))
(defcfun ("al_get_mouse_cursor_position" get-mouse-cursor-position) :boolean
  (ret-x :pointer) (ret-y :pointer))
(defcfun ("al_hide_mouse_cursor" hide-mouse-cursor) :boolean (display :pointer))
(defcfun ("al_show_mouse_cursor" show-mouse-cursor) :boolean (display :pointer))
(defcfun ("al_grab_mouse" grab-mouse) :boolean (display :pointer))
(defcfun ("al_ungrab_mouse" ungrab-mouse) :boolean)

;;; Path
(defcfun ("al_create_path" create-path) :pointer (str :string))
(defcfun ("al_create_path_for_directory" create-path-for-directory) :pointer
  (str :string))
(defcfun ("al_destroy_path" destroy-path) :void (path :pointer))
(defcfun ("al_clone_path" clone-path) :pointer (path :pointer))
(defcfun ("al_join_paths" join-paths) :boolean (path :pointer) (tail :pointer))
(defcfun ("al_rebase_path" rebase-path) :boolean (heard :pointer) (tail :pointer))
(defcfun ("al_get_path_drive" get-path-drive) :string (path :pointer))
(defcfun ("al_get_path_num_components" get-path-num-components) :int (path :pointer))
(defcfun ("al_get_path_component" get-path-component) :string
  (path :pointer) (i :int))
(defcfun ("al_get_path_tail" get-path-tail) :string (path :pointer))
(defcfun ("al_get_path_filename" get-path-filename) :string (path :pointer))
(defcfun ("al_get_path_basename" get-path-basename) :string (path :pointer))
(defcfun ("al_get_path_extension" get-path-extension) :string (path :pointer))
(defcfun ("al_set_path_drive" set-path-drive) :void
  (path :pointer) (drive :string))
(defcfun ("al_append_path_component" append-path-component) :void
  (path :pointer) (s :string))
(defcfun ("al_insert_path_component" insert-path-component) :void
  (path :pointer) (i :int) (s :string))
(defcfun ("al_replace_path_component" replace-path-component) :void
  (path :pointer) (i :int) (s :string))
(defcfun ("al_remove_path_component" remove-path-component) :void
  (path :pointer) (i :int))
(defcfun ("al_drop_path_tail" drop-path-tail) :void (path :pointer))
(defcfun ("al_set_path_filename" set-path-filename) :void
  (path :pointer) (filename :string))
(defcfun ("al_set_path_extension" set-path-extension) :boolean
  (path :pointer) (extension :string))
(defcfun ("al_path_cstr" path-cstr) :string (path :pointer) (delim :char))
(defcfun ("al_make_path_canonical" make-path-canonical) :boolean (path :pointer))

;;; State
(defcfun ("al_restore_state" restore-state) :void (state :pointer))
(defcfun ("al_store_state" store-state) :void
  (state :pointer) (flags allegro-state-flags))
(defcfun ("al_get_errno" get-errno) :int)
(defcfun ("al_set_errno" set-errno) :void (errnum :int))

;;; System
(defcfun ("al_install_system" install-system) :boolean
  (version :int) (atexit-ptr :pointer))
(defun init () (install-system (get-allegro-version) (null-pointer)))
(defcfun ("al_uninstall_system" uninstall-system) :void)
(defcfun ("al_is_system_installed" is-system-installed) :boolean)
(defcfun ("al_get_allegro_version" get-allegro-version) :uint32)
(defcfun ("al_get_standard_path" get-standard-path) :pointer (id :int))
(defcfun ("al_set_exe_name" set-exe-name) :void (path :string))
(defcfun ("al_set_app_name" set-app-name) :void (app-name :string))
(defcfun ("al_set_org_name" set-org-name) :void (org-name :string))
(defcfun ("al_get_app_name" get-app-name) :string)
(defcfun ("al_get_org_name" get-org-name) :string)
(defcfun ("al_get_system_config" get-system-config) :pointer)
(defcfun ("al_register_assert_handler" register-assert-handler) :void
  (handler :pointer) (file :string) (func :string))

;;; Time
(defcfun ("al_get_time" get-time) c-double)
(defun current-time () (get-time))
(defcfun ("al_init_timeout" init-timeout) :void
  (timeout :pointer) (seconds c-double))
(defcfun ("al_rest" rest-time) :void (seconds c-double))

;;; Timer
(defcfun ("al_create_timer" create-timer) :pointer (speed-secs c-double))
(defcfun ("al_start_timer" start-timer) :void (timer :pointer))
(defcfun ("al_stop_timer" stop-timer) :void (timer :pointer))
(defcfun ("al_get_timer_started" get-timer-started) :boolean (timer :pointer))
(defcfun ("al_destroy_timer" destroy-timer) :void (timer :pointer))
(defcfun ("al_get_timer_count" get-timer-count) :int64 (timer :pointer))
(defcfun ("al_set_timer_count" set-timer-count) :void
  (timer :pointer) (new-count :int64))
(defcfun ("al_add_timer_count" add-timer-count) :void
  (timer :pointer) (diff :int64))
(defcfun ("al_get_timer_speed" get-timer-speed) c-double (timer :pointer))
(defcfun ("al_set_timer_speed" set-timer-speed) :void
  (timer :pointer) (new-speed-secs c-double))
(defcfun ("al_get_timer_event_source" get-timer-event-source) :pointer
  (timer :pointer))

;;; Transformations
(defcfun ("al_copy_transform" copy-transform) :void (dest :pointer) (src :pointer))
(defcfun ("al_use_transform" use-transform) :void (trans :pointer))
(defcfun ("al_get_current_transform" get-current-transform) :pointer)
(defcfun ("al_invert_transform" invert-transform) :void (trans :pointer))
(defcfun ("al_check_inverse" check-inverse) :int (trans :pointer) (tol c-float))
(defcfun ("al_identity_transform" identity-transform) :void (trans :pointer))
(defcfun ("al_build_transform" build-transform) :void
  (trans :pointer) (x c-float) (y c-float) (sx c-float) (sy c-float) (theta c-float))
(defcfun ("al_translate_transform" translate-transform) :void
  (trans :pointer) (x c-float) (y c-float))
(defcfun ("al_rotate_transform" rotate-transform) :void
  (trans :pointer) (theta c-float))
(defcfun ("al_scale_transform" scale-transform) :void
  (trans :pointer) (sx c-float) (sy c-float))
(defcfun ("al_transform_coordinates" transform-coordinates) :void
  (trans :pointer) (x c-float) (y c-float))
(defcfun ("al_compose_transform" compose-transform) :void
  (trans :pointer) (other :pointer))

;;; Miscellaneous routines

;;; OpenGL
(defcfun ("al_get_opengl_extension_list" get-opengl-extension-list) :pointer)
(defcfun ("al_get_opengl_proc_address" get-opengl-proc-address) :pointer
  (name :string))
(defcfun ("al_get_opengl_texture" get-opengl-texture) :uint (bitmap :pointer))
(defcfun ("al_get_opengl_texture_size" get-opengl-texture-size) :void
  (bitmap :pointer) (width :pointer) (height :pointer))
(defcfun ("al_get_opengl_texture_position" get-opengl-texture-position) :void
  (bitmap :pointer) (u :pointer) (v :pointer))
(defcfun ("al_get_opengl_texture_fbo" get-opengl-texture-fbo) :uint
  (bitmap :pointer))
(defcfun ("al_remove_opengl_texture_fbo" remove-opengl-texture-fbo) :uint
  (bitmap :pointer))
(defcfun ("al_have_opengl_extension" have-opengl-extension) :boolean
  (extension :string))
(defcfun ("al_get_opengl_version" get-opengl-version) :uint32)
(defcfun ("al_get_opengl_variant" get-opengl-variant) :int)
(defcfun ("al_set_current_opengl_context" set-current-opengl-context) :void
  (display :pointer))

;;; Audio addon
;; Setting up audio
(defcfun ("al_install_audio" install-audio) :boolean)
(defcfun ("al_uninstall_audio" uninstall-audio) :void)
(defcfun ("al_is_audio_installed" is-audio-installed) :boolean)
(defcfun ("al_reserve_samples" reserve-samples) :boolean (reserve-samples :int))

;; Misc audio functions
(defcfun ("al_get_allegro_audio_version" get-allegro-audio-version) :uint32)
(defcfun ("al_get_audio_depth_size" get-audio-depth-size) :uint
  (depth allegro-audio-depth))
(defcfun ("al_get_channel_count" get-channel-count) :uint
  (conf allegro-channel-conf))

;; Voice functions
(defcfun ("al_create_voice" create-voice) :pointer
  (freq :uint) (depth allegro-audio-depth) (chan-conf allegro-channel-conf))
(defcfun ("al_destroy_voice" destory-voice) :void (voice :pointer))
(defcfun ("al_detach_voice" detach-voice) :void (voice :pointer))
(defcfun ("al_attach_audio_stream_to_voice" attach-audio-stream-to-voice) :boolean
    (stream :pointer) (voice :pointer))
(defcfun ("al_attach_mixer_to_voice" attach-mixer-to-voice) :boolean
  (mixer :pointer) (voice :pointer))
(defcfun ("al_attach_sample_instance_to_voice" attach-sample-instance-to-voice)
    :boolean
  (spl :pointer) (voice :pointer))
(defcfun ("al_get_voice_frequency" get-voice-frequency) :uint (voice :pointer))
(defcfun ("al_get_voice_channels" get-voice-channels) allegro-channel-conf
  (voice :pointer))
(defcfun ("al_get_voice_depth" get-voice-depth) allegro-audio-depth
  (voice :pointer))
(defcfun ("al_get_voice_playing" get-voice-playing) :boolean (voice :pointer))
(defcfun ("al_set_voice_playing" set-voice-playing) :boolean
  (voice :pointer) (val :boolean))
(defcfun ("al_get_voice_position" get-voice-position) :uint (voice :pointer))
(defcfun ("al_set_voice_position" set-voice-position) :boolean
  (voice :pointer) (val :int))

;; Sample functions
(defcfun ("al_create_sample" create-sample) :pointer
  (buf :pointer) (samples :uint) (freq :uint)
  (depth allegro-audio-depth) (chan-conf allegro-channel-conf)
  (free-buf :boolean))
(defcfun ("al_destroy_sample" destroy-sample) :void (spl :pointer))
(defcfun ("al_play_sample" play-sample) :boolean
  (spl :pointer)
  (gain c-float) (pan c-float) (speed c-float)
  (playmode allegro-playmode)
  (ret-id :pointer))
(defcfun ("al_stop_sample" stop-sample) :void (spl-id :pointer))
(defcfun ("al_stop_samples" stop-samples) :void)
(defcfun ("al_get_sample_channels" get-sample-channels) allegro-channel-conf
  (spl :pointer))
(defcfun ("al_get_sample_depth" get-sample-depth) allegro-audio-depth
  (spl :pointer))
(defcfun ("al_get_sample_frequency" get-sample-frequency) :uint (spl :pointer))
(defcfun ("al_get_sample_length" get-sample-length) :uint (spl :pointer))
(defcfun ("al_get_sample_data" get-sample-data) :void (spl :pointer))

;; Sample instance functions
(defcfun ("al_create_sample_instance" create-sample-instance) :pointer
  (sample-data :pointer))
(defcfun ("al_destroy_sample_instance" destroy-sample-instance) :void
  (sample-data :pointer))
(defcfun ("al_play_sample_instance" play-sample-instance) :boolean (spl :pointer))
(defcfun ("al_stop_sample_instance" stop-sample-instance) :boolean (spl :pointer))
(defcfun ("al_get_sample_instance_channels" get-sample-instance-channels)
    allegro-channel-conf
  (spl :pointer))
(defcfun ("al_get_sample_instance_depth" get-sample-instance-depth)
    allegro-audio-depth
  (spl :pointer))
(defcfun ("al_get_sample_instance_frequency" get-sample-instance-frequency) :uint
  (spt :pointer))
(defcfun ("al_get_sample_instance_length" get-sample-instance-length) :uint
  (spt :pointer))
(defcfun ("al_set_sample_instance_length" set-sample-instance-length) :boolean
  (spt :pointer) (val :uint))
(defcfun ("al_get_sample_instance_position" get-sample-instance-position) :uint
  (spl :pointer))
(defcfun ("al_set_sample_instance_position" set-sample-instance-position) :boolean
  (spl :pointer) (val :uint))
(defcfun ("al_get_sample_instance_speed" get-sample-instance-speed) c-float
  (spl :pointer))
(defcfun ("al_set_sample_instance_speed" set-sample-instance-speed) :boolean
  (spl :pointer) (val c-float))
(defcfun ("al_get_sample_instance_gain" get-sample-instance-gain) c-float
  (spl :pointer))
(defcfun ("al_set_sample_instance_gain" set-sample-instance-gain) :boolean
  (spl :pointer) (val c-float))
(defcfun ("al_get_sample_instance_pan" get-sample-instance-pan) c-float
  (spl :pointer))
(defcfun ("al_set_sample_instance_pan" set-sample-instance-pan) :boolean
  (spl :pointer) (val c-float))
(defcfun ("al_get_sample_instance_time" get-sample-instance-time) c-float
  (spl :pointer))
(defcfun ("al_get_sample_instance_playmode" get-sample-instance-playmode)
    allegro-playmode
  (spl :pointer))
(defcfun ("al_set_sample_instance_playmode" set-sample-instance-playmode) :boolean
  (spl :pointer) (val c-float))
(defcfun ("al_get_sample_instance_playing" get-sample-instance-playing) :boolean
  (spl :pointer))
(defcfun ("al_set_sample_instance_playing" set-sample-instance-playing) :boolean
  (spl :pointer) (val c-float))
(defcfun ("al_get_sample_instance_attached" get-sample-instance-attached) :boolean
  (spl :pointer))
(defcfun ("al_detach_sample_instance" detach-sample-instance) :boolean
  (spl :pointer))
(defcfun ("al_get_sample" get-sample) :pointer (spl :pointer))
(defcfun ("al_set_sample" set-sample) :boolean (spl :pointer) (data :pointer))

;; Mixer functions
(defcfun ("al_create_mixer" create-mixer) :pointer
  (freq :uint) (depth allegro-audio-depth) (chan-conf allegro-channel-conf))
(defcfun ("al_destroy_mixer" destroy-mixer) :void (mixer :pointer))
(defcfun ("al_get_default_mixer" get-default-mixer) :pointer)
(defcfun ("al_set_default_mixer" set-default-mixer) :boolean (mixer :pointer))
(defcfun ("al_restore_default_mixer" restore-default-mixer) :boolean)
(defcfun ("al_attach_mixer_to_mixer" attach-mixer-to-mixer) :boolean
  (stream :pointer) (mixer :pointer))
(defcfun ("al_attach_sample_instance_to_mixer" attach-sample-instance-to-mixer)
    :boolean
  (spl :pointer) (mixer :pointer))
(defcfun ("al_attach_audio_stream_to_mixer" attach-audio-stream-to-mixer) :boolean
  (stream :pointer) (mixer :pointer))
(defcfun ("al_get_mixer_frequency" get-mixer-frequency) :uint (mixer :pointer))
(defcfun ("al_set_mixer_frequency" set-mixer-frequency) :boolean
  (mixer :pointer) (val :uint))
(defcfun ("al_get_mixer_channels" get-mixer-channels) allegro-channel-conf
  (mixer :pointer))
(defcfun ("al_get_mixer_depth" get-mixer-depth) allegro-audio-depth
  (mixer :pointer))
(defcfun ("al_get_mixer_gain" get-mixer-gain) c-float
  (mixer :pointer))
(defcfun ("al_set_mixer_gain" set-mixer-gain) :boolean
  (mixer :pointer) (new-gain c-float))
(defcfun ("al_get_mixer_quality" get-mixer-quality) allegro-mixer-quality
  (mixer :pointer))
(defcfun ("al_set_mixer_quality" set-mixer-quality) :boolean
  (mixer :pointer) (new-quality allegro-mixer-quality))
(defcfun ("al_get_mixer_playing" get-mixer-playing) :boolean
  (mixer :pointer))
(defcfun ("al_set_mixer_playing" set-mixer-playing) :boolean
  (mixer :pointer) (val :boolean))
(defcfun ("al_get_mixer_attached" get-mixer-attached) :boolean (mixer :pointer))
(defcfun ("al_detach_mixer" detach-mixer) :boolean (mixer :pointer))
(defcfun ("al_set_mixer_postprocess_callback" set-mixer-postprocess-callback)
    :boolean
  (mixer :pointer) (pp-callback :pointer) (pp-callback-userdata :pointer))

;; Stream functions
(defcfun ("al_create_audio_stream" create-audio-stream) :pointer
  (fragment-count :uint) (frag-samples :uint) (freq :uint)
  (depth allegro-audio-depth) (chan-conf allegro-channel-conf))
(defcfun ("al_destroy_audio_stream" destroy-audio-stream) :void (stream :pointer))
(defcfun ("al_get_audio_stream_event_source" get-sudio-stream-event-source)
    :pointer
  (stream :pointer))
(defcfun ("al_drain_audio_stream" drain-audio-stream) :void (stream :pointer))
(defcfun ("al_rewind_audio_stream" rewind-audio-stream) :boolean (stream :pointer))
(defcfun ("al_get_audio_stream_frequency" get-audio-stream-frequency) :uint
  (stream :pointer))
(defcfun ("al_get_audio_stream_channels" get-audio-stream-channels)
    allegro-channel-conf
  (stream :pointer))
(defcfun ("al_get_audio_stream_depth" get-audio-stream-depth) allegro-audio-depth
  (stream :pointer))
(defcfun ("al_get_audio_stream_length" get-audio-stream-length) :uint
  (stream :pointer))
(defcfun ("al_get_audio_stream_speed" get-audio-stream-speed) c-float
  (stream :pointer))
(defcfun ("al_set_audio_stream_speed" set-audio-stream-speed) :boolean
  (stream :pointer) (val c-float))
(defcfun ("al_get_audio_stream_gain" get-audio-stream-gain) c-float
  (stream :pointer))
(defcfun ("al_set_audio_stream_gain" set-audio-stream-gain) :boolean
  (stream :pointer) (val c-float))
(defcfun ("al_get_audio_stream_pan" get-audio-stream-pan) c-float
  (stream :pointer))
(defcfun ("al_set_audio_stream_pan" set-audio-stream-pan) :boolean
  (stream :pointer) (val c-float))
(defcfun ("al_get_audio_stream_playing" get-audio-stream-playing) :boolean
  (stream :pointer))
(defcfun ("al_set_audio_stream_playing" set-audio-stream-playing) :boolean
  (stream :pointer) (val c-float))
(defcfun ("al_get_audio_stream_playmode" get-audio-stream-playmode) allegro-playmode
  (stream :pointer))
(defcfun ("al_set_audio_stream_playmode" set-audio-stream-playmode) :boolean
  (stream :pointer) (val allegro-playmode))
(defcfun ("al_get_audio_stream_attached" get-audio-stream-attached) :boolean
  (stream :pointer))
(defcfun ("al_detach_audio_stream" detach-audio-stream) :boolean
  (stream :pointer))
(defcfun ("al_get_audio_stream_fragment" get-audio-stream-fragment) :pointer
  (stream :pointer))
(defcfun ("al_set_audio_stream_fragment" set-audio-stream-fragment) :boolean
  (stream :pointer) (val :pointer))
(defcfun ("al_get_audio_stream_fragments" get-audio-stream-fragments) :uint
  (stream :pointer))
(defcfun ("al_get_available_audio_stream_fragments"
	  get-available-audio-stream-fragments) :uint
  (stream :pointer))
(defcfun ("al_seek_audio_stream_secs" seek-audio-stream-secs) :boolean
  (stream :pointer) (time c-double))
(defcfun ("al_get_audio_stream_position_secs"
	  get-audio-stream-position-secs) c-double
  (stream :pointer))
(defcfun ("al_get_audio_stream_length_secs" get-audio-stream-length-secs) c-double
  (stream :pointer))
(defcfun ("al_set_audio_stream_loop_secs" set-audio-stream-loop-secs) :boolean
  (stream :pointer) (start c-double) (end c-double))

;; Audio file I/O
(defcfun ("al_register_sample_loader" register-sample-loader) :boolean
  (ext :string) (loader :pointer))
(defcfun ("al_register_sample_loader_f" register-sample-loader-f) :boolean
  (ext :string) (loader :pointer))
(defcfun ("al_register_sample_saver" register-sample-saver) :boolean
  (ext :string) (saver :boolean))
(defcfun ("al_register_sample_saver_f" register-sample-saver-f) :boolean
  (ext :string) (saver :boolean))
(defcfun ("al_register_audio_stream_loader" register-audio-stream-loader) :boolean
  (ext :string) (stream-loader :pointer))
(defcfun ("al_register_audio_stream_loader_f" register-audio-stream-loader-f)
    :boolean
  (ext :string) (stream-loader :pointer))
(defcfun ("al_load_sample" load-sample) :pointer (filename :string))
(defcfun ("al_load_sample_f" load-sample-f) :pointer (fp :pointer) (ident :string))
(defcfun ("al_load_audio_stream" load-audio-stream) :pointer
  (filename :string) (buffer-count :int) (samples :uint))
(defcfun ("al_load_audio_stream_f" load-audio-stream-f) :pointer
  (fp :pointer) (ident :string) (buffer-count :int) (samples :uint))
(defcfun ("al_save_sample" save-sample) :boolean
  (filename :string) (spl :pointer))
(defcfun ("al_save_sample_f" save-sample-f) :boolean
  (fp :pointer) (ident :string) (spl :pointer))

;;; Audio codecs addon
(defcfun ("al_init_acodec_addon" init-acodec-addon) :boolean)
(defcfun ("al_get_allegro_acodec_version" get-allegro-acodec-version) :uint32)

;;; Font addons
;; General font routinues
(defcfun ("al_init_font_addon" init-font-addon) :void)
(defcfun ("al_shutdown_font_addon" shutdown-font-addon) :void)
(defcfun ("al_load_font" load-font) :pointer
  (filename :string) (size :int) (flags :int))
(defcfun ("al_destroy_font" destroy-font) :void (f :pointer))
(defcfun ("al_register_font_loader" register-font-loader) :boolean
    (extension :string) (load-font :pointer))
(defcfun ("al_get_font_line_height" get-font-line-height) :int (f :pointer))
(defcfun ("al_get_font_ascent" get-font-ascent) :int (f :pointer))
(defcfun ("al_get_font_descent" get-font-descent) :int (f :pointer))
(defcfun ("al_get_text_width" get-text-width) :int (f :pointer) (str :string))
(defcfun ("al_get_ustr_width" get-ustr-width) :int (f :pointer) (ustr :pointer))
(defcfun ("al_draw_text" draw-text) :void
  (font :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (x c-float) (y c-float)
  (flags :int)
  (text :string))
(defcfun ("al_draw_ustr" draw-ustr) :void
  (font :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (x c-float) (y c-float)
  (flags :int)
  (ustr :pointer))
(defcfun ("al_draw_justified_text" draw-justified-text) :void
  (font :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (x1 c-float) (x2 c-float) (y c-float) (diff c-float)
  (flags :int)
  (text :string))
(defcfun ("al_draw_justified_ustr" draw-justified-ustr) :void
  (font :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (x1 c-float) (x2 c-float) (y c-float) (diff c-float)
  (flags :int)
  (ustr :pointer))
(defcfun ("al_draw_textf" draw-textf) :void
  (font :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (x c-float) (y c-float)
  (flags :int)
  (format :string))
(defcfun ("al_draw_justified_textf" draw-justified-textf) :void
  (font :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (x1 c-float) (x2 c-float) (y c-float) (diff c-float)
  (flags :int)
  (format :string))
(defcfun ("al_get_text_dimensions" get-text-dimensions) :void
  (f :pointer) (text :string)
  (bbx :pointer) (bby :pointer)
  (bbw :pointer) (bbh :pointer))
(defcfun ("al_get_ustr_dimensions" get-ustr-dimensions) :void
  (f :pointer) (ustr :pointer)
  (bbx :pointer) (bby :pointer)
  (bbw :pointer) (bbh :pointer))
(defcfun ("al_get_allegro_font_version" get-allegro-font-version) :uint32)

;; Bitmap fonts
(defcfun ("al_grab_font_from_bitmap" grab-font-from-bitmap) :pointer
  (bmp :pointer) (ranges-n :int) (range :pointer))
(defcfun ("al_load_bitmap_font" load-bitmap-font) :pointer (fname :string))
(defcfun ("al_create_builtin_font" create-builtin-font) :pointer)

;; TTF fonts
(defcfun ("al_init_ttf_addon" init-ttf-addon) :boolean)
(defcfun ("al_shutdown_ttf_addon" shutdown-ttf-addon) :void)
(defcfun ("al_load_ttf_font" load-ttf-font) :pointer
  (filename :string) (size :int) (flags :int))
(defcfun ("al_load_ttf_font_f" load-ttf-font-f) :pointer
  (file :pointer) (filename :string) (size :int) (flags :int))
(defcfun ("al_load_ttf_font_stretch" load-ttf-font-stretch) :pointer
  (filename :string) (w :int) (h :int) (flags :int))
(defcfun ("al_load_ttf_font_stretch_f" load-ttf-font-stretch-f) :pointer
  (file :pointer) (filename :string) (w :int) (h :int) (flags :int))
(defcfun ("al_get_allegro_ttf_version" get-allegro-ttf-version) :uint32)

;;; Image I/O addon
(defcfun ("al_init_image_addon" init-image-addon) :boolean)
(defcfun ("al_shutdown_image_addon" shutdown-image-addon) :void)
(defcfun ("al_get_allegro_image_version" get-allegro-image-version) :uint32)

;;; Memfile addon
(defcfun ("al_open_memfile" open-memfile) :pointer
  (mem :pointer) (size :int64) (mode :pointer))
(defcfun ("al_get_allegro_memfile_version" get-allegro-memfile-version) :uint32)

;;; Native dialogs support
(defcfun ("al_init_native_dialog_addon" init-native-dialog-addon) :boolean)
(defcfun ("al_shutdown_native_dialog_addon" shutdown-native-dialog-addon) :void)
(defcfun ("al_create_native_file_dialog" create-native-file-dialog) :pointer
  (initial-path :string) (title :string) (patterns :string) (mode :int))
(defcfun ("al_show_native_file_dialog" show-native-file-dialog) :boolean
  (display :pointer) (dialog :pointer))
(defcfun ("al_get_native_file_dialog_count" get-native-file-dialog-count) :int
  (dialog :pointer))
(defcfun ("al_get_native_file_dialog_path" get-native-file-dialog-path) :string
  (dialog :pointer) (i :uint))
(defcfun ("al_destroy_native_file_dialog" destroy-native-file-dialog) :void
  (dialog :pointer))
(defcfun ("al_show_native_message_box" show-native-message-box) :int
  (display :pointer) (title :string) (heading :string)
  (text :string) (buttons :string) (flags :int))
(defcfun ("al_open_native_text_log" open-native-text-log) :pointer
  (title :string) (flags :int))
(defcfun ("al_close_native_text_log" close-native-text-log) :void
  (textlog :pointer))
(defcfun ("al_append_native_text_log" append-native-text-log) :void
  (textlog :pointer) (format :string))
(defcfun ("al_get_native_text_log_event_source" get-native-text-log-event-source)
    :pointer
  (textlog :pointer))
(defcfun ("al_get_allegro_native_dialog_version" get-allegro-native-dialog-version)
    :uint32)

;;; PhysicsFS addon
(defcfun ("al_set_physfs_file_interface" set-physfs-file-interface) :void)
(defcfun ("al_get_allegro_physfs_version" get-allegro-physfs-version) :uint32)

;;; Primitives addon
;; General
(defcfun ("al_get_allegro_primitives_version" get-allegro-primitives-version)
    :uint32)
(defcfun ("al_init_primitives_addon" init-primitives-addon) :boolean)
(defcfun ("al_shutdown_primitives_addon" shutdown-primitives-addon) :boolean)

;; High level drawing routines
(defcfun ("al_draw_line" draw-line) :void 
  (x1 c-float) (y1 c-float) (x2 c-float) (y2 c-float)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_draw_triangle" draw-triangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (x3 c-float) (y3 c-float)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_draw_filled_triangle" draw-filled-triangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (x3 c-float) (y3 c-float)
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_draw_rectangle" draw-rectangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_draw_filled_rectangle" draw-filled-rectangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_draw_rounded_rectangle" draw-rounded-rectangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (rx c-float) (ry c-float) 
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_draw_filled_rounded_rectangle" draw-filled-rounded-rectangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (rx c-float) (ry c-float) 
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_calculate_arc" calculate-arc) :void
  (dest :pointer) (stride :int) 
  (cx c-float) (cy c-float)
  (rx c-float) (ry c-float)
  (start-theta c-float) (delta-theta c-float)
  (thickness c-float) (num-segments :int))
(defcfun ("al_draw_pieslice" draw-pieslice) :void 
  (cx c-float) (cy c-float) (radius c-float)
  (start-theta c-float) (delta-theta c-float)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_draw_filled_pieslice" draw-filled-pieslice) :void 
  (cx c-float) (cy c-float) (radius c-float)
  (start-theta c-float) (delta-theta c-float)
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_draw_ellipse" draw-ellipse) :void
  (cx c-float) (cy c-float) (rx c-float) (ry c-float)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_draw_filled_ellipse" draw-filled-ellipse) :void
  (cx c-float) (cy c-float) (rx c-float) (ry c-float)
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_draw_circle" draw-circle) :void
  (cx c-float) (cy c-float) (radius c-float)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_draw_filled_circle" draw-filled-circle) :void
  (cx c-float) (cy c-float) (radius c-float)
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_draw_arc" draw-arc) :void 
  (cx c-float) (cy c-float) (radius c-float)
  (start-theta c-float) (delta-theta c-float)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_draw_elliptical_arc" draw-elliptical-arc) :void 
  (cx c-float) (cy c-float) (rx c-float) (ry c-float)
  (start-theta c-float) (delta-theta c-float)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_calculate_spline" calculate-spline) :void
  (dest :pointer) (stride :int) (points :pointer)
  (thickness c-float) (num-segments :int))
(defcfun ("al_draw_spline" draw-spline) :void
  (points :pointer)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float))
(defcfun ("al_calculate_ribbon" calculate-ribbon) :void
  (dest :pointer) (dest-stride :int) 
  (points :pointer) (points-stride :int)
  (thickness c-float) (num-segments :int))
(defcfun ("al_draw_ribbon" draw-ribbon) :void
  (points :pointer) (points-stride :int)
  (r c-float) (g c-float) (b c-float) (a c-float)
  (thickness c-float) (num-segments :int))

;; Low level drawing routines
(defcfun ("al_draw_prim" draw-prim) :int 
  (vtxs :pointer) (decl :pointer) (texture :pointer)
  (start :int) (end :int) (type :int))
(defcfun ("al_draw_indexed_prim" draw-indexed-prim) :int 
  (vtxs :pointer) (decl :pointer) (texture :pointer)
  (indices :pointer) (num-vtx :int) (type :int))
(defcfun ("al_create_vertex_decl" create-vertex-decl) :pointer
  (elements :pointer) (stride :int))
(defcfun ("al_destroy_vertex_decl" destroy-vertex-decl) :void)
(defcfun ("al_draw_soft_triangle" draw-soft-triangle) :void
  (v1 :pointer) (v2 :pointer) (v3 :pointer) (state :pointer)
  (init :pointer) (first :pointer) (step :pointer) (draw :pointer))
(defcfun ("al_draw_soft_line" draw-soft-line) :void
  (v1 :pointer) (v2 :pointer) (state :pointer)
  (first :pointer) (step :pointer) (draw :pointer))
