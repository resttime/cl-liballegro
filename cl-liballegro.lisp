(ql:quickload "cffi")

(defpackage #:cl-liballegro
  (:use #:cl #:cffi)
  (:nicknames #:al)
  (:export
   
   ;; Configuration Files
   #:create-config
   #:destroy-config
   #:load-config-file
   #:load-config-file-f
   #:save-config-file
   #:save-config-file-f
   #:add-config-section
   #:remove-config-section
   #:add-config-comment
   #:get-config-value
   #:set-config-value
   #:get-first-config-section
   #:get-next-config-section
   #:get-first-config-entry
   #:get-next-config-entry
   #:merge-config
   #:merge-config-into))
(in-package #:cl-liballegro)

(define-foreign-library liballegro
  (:windows "allegro-5.0.8-monolith-mt.dll")
  (:unix (:default "liballegro")))
(use-foreign-library liballegro)

(define-foreign-library liballegro-acodec
  (:unix (:default "liballegro_acodec")))
(use-foreign-library liballegro-acodec)

(define-foreign-library liballegro-audio
  (:unix (:default "liballegro_audio")))
(use-foreign-library liballegro-audio)

(define-foreign-library liballegro-color
  (:unix (:default "liballegro_color")))
(use-foreign-library liballegro-color)

(define-foreign-library liballegro-dialog
  (:unix (:default "liballegro_dialog")))
(use-foreign-library liballegro-dialog)

(define-foreign-library liballegro-font
  (:unix (:default "liballegro_font")))
(use-foreign-library liballegro-font)

(define-foreign-library liballegro-image
  (:unix (:default "liballegro_image")))
(use-foreign-library liballegro-image)

(define-foreign-library liballegro-memfile
  (:unix (:default "liballegro_memfile")))
(use-foreign-library liballegro-memfile)

(define-foreign-library liballegro-physfs
  (:unix (:default "liballegro_physfs")))
(use-foreign-library liballegro-physfs)

(define-foreign-library liballegro-primitives
  (:unix (:default "liballegro_primitives")))
(use-foreign-library liballegro-primitives)

(define-foreign-library liballegro-ttf
  (:unix (:default "liballegro_ttf")))
(use-foreign-library liballegro-ttf)

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
;; Display Creation
(defcstruct allegro-display)

(defcfun ("al_create_display" create-display) :pointer (width :int) (height :int))
(defcfun ("al_destroy_display" destroy-display) :void (display :pointer))

(defcfun ("al_set_new_display_flags" set-new-display-flags) :void (flags :int))

;; Display Operations

(defcfun ("al_flip_display" flip-display) :void)
(defcfun ("al_get_backbuffer" get-back-buffer) :pointer (display :pointer))

(defcfun ("al_get_display_event_source" get-display-event-source) :pointer
  (display :pointer))

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

(defcstruct allegro-any-event
  (type allegro-event-type)
  (source :pointer)
  (timestamp :double))
(defcstruct allegro-display-event
  (type allegro-event-type)
  (source :pointer)
  (timestamp :double)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (orientation :int))
(defcstruct allegro-joystick-event
  (type allegro-event-type)
  (source :pointer)
  (timestamp :double)
  (id :pointer)
  (stick :int)
  (axis :int)
  (pos :float)
  (button :int))
(defcstruct allegro-keyboard-event
  (type allegro-event-type)
  (source :pointer)
  (timestamp :double)
  (display allegro-display)
  (keycode :int)
  (unichar :int)
  (modifiers :uint)
  (repeat :boolean))
(defcstruct allegro-mouse-event
  (type allegro-event-type)
  (source :pointer)
  (timestamp :double)
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
  (type allegro-event-type)
  (source :pointer)
  (timestamp :double)
  (count :int64)
  (error :double))
(defcstruct allegro-user-event
  (type allegro-event-type)
  (source :pointer)
  (timestamp :double)
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
