(ql:quickload "cffi")

(in-package :cl-liballegro)

;;; base.h
(defconstant +allegro-version+ 5)
(defconstant +allegro-sub-version+ 0)
(defconstant +allegro-wip-version+ 8)
(defconstant +allegro-release-number+ 1)

(defconstant +allegro-version-int+ (logior (ash +allegro-version+ 24)
					   (ash +allegro-sub-version+ 16)
					   (ash +allegro-wip-version+ 8)
					   +allegro-release-number+))

(defconstant +allegro-pi+ 3.14159265358979323846)

(defcfun "al_get_allegro_version" :uint32)
(defun al-id (a b c d)
  (logior (ash a 24)
	  (ash b 16)
	  (ash c 8)
	  d))

;;; color.h
(defcstruct allegro-color
  (r :float)
  (g :float)
  (b :float)
  (a :float))

;;; system.h
(defcfun "al_install_system" :boolean (version :int) (atexit-ptr :pointer))
(defcfun "al_uninstall_system" :void)
(defcfun "al_is_system_installed" :boolean)
(defun al-init ()
  (al-install-system +allegro-version-int+ (null-pointer)))

;;; display.h
(defconstant +allegro-windowed+ (ash 1 0))
(defconstant +allegro-fullscreen+ (ash 1 1))
(defconstant +allegro-opengl+ (ash 1 2))
(defconstant +allegro-direct3d-internal+ (ash 1 3))
(defconstant +allegro-resizable+ (ash 1 4))
(defconstant +allegro-frameless+ (ash 1 5))
(defconstant +allegro-noframe+ +allegro-frameless+)
(defconstant +allegro-generate-expose-events+ (ash 1 6))
(defconstant +allegro-opengl-3-0+ (ash 1 7))
(defconstant +allegro-opengl-forward-compatible+ (ash 1 8))
(defconstant +allegro-fullscreen-window+ (ash 1 9))
(defconstant +allegro-minimized+ (ash 1 10))

(defctype allegro-display :pointer)

(defcfun "al_create_display" allegro-display (width :int) (height :int))
(defcfun "al_destroy_display" :void (display allegro-display))
(defcfun "al_flip_display" :void)
(defcfun "al_set_new_display_flags" :void (flags :int))
(defcfun "al_clear_to_color" :void
  (r :float) (g :float) (b :float) (a :float))
(defcfun "al_get_display_event_source" :pointer (display :pointer))
(defcfun "al_set_target_bitmap" :void (bitmap :pointer)) ; allegro-bitmap pointer
(defcfun "al_get_backbuffer" :pointer (display :pointer))
 
;;; altime.h
(defcstruct allegro-timeout
  (--pad1-- :uint64)
  (--pad2-- :uint64))

(defcfun "al_rest" :void (seconds :double))
(defcfun "al_init_timeout" :void
  (timeout (:pointer allegro-timeout))
  (seconds :double))

;;; allegro_image.h
(defcfun "al_init_image_addon" :boolean)

;;; allegro_primitives.h
(defcfun "al_init_primitives_addon" :boolean)

;;; events.h
(defctype allegro-event-type :uint)

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

(defun allegro-event-type-is-user (event-type)
  (>= event-type 512))
(defun allegro-get-event-type (a b c d)
  (al-id a b c d))

(defctype allegro-event-queue :pointer)
(defctype allegro-event-source :pointer)

(defcstruct (allegro-event-source :size 128))

;(defmacro -al-event-header ()
; (type allegro-event-type)
;  (source :pointer)
;  (timestamp :double)

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
  (id :pointer) ; ALLEGRO_JOYSTICK type pointer!
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
  (--internal--descr :pointer) ; ALLEGRO_USER_EVENT_DESCRIPTOR type pointer
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

; 1 = Left Button
; 2 = Right Button
; 3 = Middle Button
(defmacro with-mouse-slots (mouse &body body)
  `(with-foreign-slots ((type x y button) ,mouse allegro-mouse-event) 
     ,@body))

(defmacro with-keyboard-slots (kb &body body)
  `(with-foreign-slots ((type keycode) ,kb allegro-keyboard-event) 
     ,@body))

(defcfun "al_create_event_queue" allegro-event-queue)
(defcfun "al_destroy_event_queue" :void (queue allegro-event-queue))
(defcfun "al_register_event_source" :void
  (queue (:pointer allegro-event-queue))
  (source(:pointer allegro-event-source)))
(defcfun "al_is_event_queue_empty" :boolean (queue allegro-event-queue))
(defcfun "al_wait_for_event" :void
  (queue allegro-event-queue)
  (ret-event (allegro-event)))
(defcfun "al_wait_for_event_until" :boolean
  (queue :pointer)
  (ret-event :pointer)
  (timeout :pointer ))

;;; timer.h
(defctype allegro-timer :pointer)

(defcfun "al_create_timer" allegro-timer (speed-secs :double))
(defcfun "al_destroy_timer" :void (timer :pointer))
(defcfun "al_start_timer" :void (timer :pointer))
(defcfun "al_get_timer_event_source" allegro-event-source (timer :pointer))

;;; bitmap.h
(defconstant +allegro-flip-horizontal+ #x00001)
(defconstant +allegro-flip-vertical+ #x00002)

(defctype allegro-bitmap :pointer)
(defcfun "al_create_bitmap" :pointer (w :int) (h :int))
(defcfun "al_destroy_bitmap" :void (bitmap :pointer))
(defcfun "al_draw_bitmap" :void
  (bitmap :pointer) (dx :float) (dy :float) (flags :int))
(defcfun "al_draw_tinted_bitmap" :void
  (bitmap :pointer)
  (r :float) (g :float) (b :float) (a :float)
  (dx :float) (dy :float) (flags :int))
(defcfun "al_draw_rotated_bitmap" :void
  (bitmap :pointer)
  (cx :float) (cy :float) (dx :float) (dy :float) (angle :float)
  (flags :int))
(defcfun "al_load_bitmap" :pointer (filename (:pointer :char)))
(defcfun "al_get_bitmap_width" :int (bitmap :pointer))
(defcfun "al_get_bitmap_height" :int (bitmap :pointer))

;;; mouse.h
(defcfun "al_is_mouse_installed" :boolean)
(defcfun "al_install_mouse" :boolean)
(defcfun "al_uninstall_mouse" :void)
(defcfun "al_get_mouse_event_source" :pointer)

;;; keyboard.h
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
(defconstant +allegro-key-backspace 63)
(defconstant +allegro-key-tab 64)

(defconstant +allegro-key-enter+ 67)

(defconstant +allegro-key-space+ 75)

(defconstant +allegro-key-left+ 82)
(defconstant +allegro-key-right+ 83)
(defconstant +allegro-key-up+ 84)
(defconstant +allegro-key-down+ 85)

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

(defconstant +allegro-keymod-shift+ #x00001)
(defconstant +allegro-keymod-ctrl+ #x00002)
(defconstant +allegro-keymod-alt+ #x00004)
(defconstant +allegro-keymod-lwin+ #x00008)
(defconstant +allegro-keymod-rwin+ #x00010)

(defcfun "al_is_keyboard_installed" :boolean)
(defcfun "al_install_keyboard" :boolean)
(defcfun "al_uninstall_keyboard" :void)
(defcfun "al_get_keyboard_event_source" :pointer)

(defmacro get-event-type (ev)
  `(foreign-slot-value ,ev 'allegro-event 'type))
(defmacro get-keyboard (ev)
  `(foreign-slot-value ,ev 'allegro-event 'keyboard))
(defmacro get-mouse (ev)
  `(foreign-slot-value ,ev 'allegro-event 'mouse))

(defmacro with-allegro-event (ev &body body)
  `(let ((,ev (foreign-alloc 'allegro-event)))
     (with-slots ((keyboard) ,ev allegro-event)
       (with-slots ((keycode) keyboard allegro-keyboard-event)
	 ,@body
	 (foreign-free ,ev)))))

;;; allegro_acodec.h
(defcfun "al_init_acodec_addon" :boolean)
(defcfun "al_get_allegro_acodec_version" :uint32)

;;; allegro_audio.h
(defconstant +allegro-playmode-once+ #x100)
(defconstant +allegro-playmode-loop+ #x101)
(defconstant +allegro-playmode-loop-bidir+ #x102)
(defconstant +-allegro-playmode-stream-once+ #x103)
(defconstant +-allegro-playmode-stream-onedir+ #x104)

(defconstant +allegro-mixer-quality-point+ #x110)
(defconstant +allegro-mixer-quality-linear+ #x111)
(defconstant +allegro-mixer-quality-cubic+ #x112)

(defctype allegro-sample :pointer)
(defcstruct allegro-sample-id
  (-index :int)
  (-id :int))
    
(defcfun "al_is_audio_installed" :boolean)

;; There is a bug where it is unable to choose the correct audio driver!
;; This can be remedied with a [audio] entry in /etc/allegro5,cfg
(defcfun "al_install_audio" :boolean)

(defcfun "al_uninstall_audio" :void)
(defcfun "al_destroy_sample" :void (spl allegro-sample))

(defcfun "al_play_sample" :boolean
  (spl allegro-sample)
  (gain :float) (pan :float) (speed :float)
  (playmode :uint)
  (ret-id :pointer))
(defcfun "al_reserve_samples" :boolean (reserve-samples :int))
(defcfun "al_load_sample" allegro-sample (filename :pointer))

;;; allegro_font.h
(defconstant +allegro-align-left+ 0)
(defconstant +allegro-align-centre+ 1)
(defconstant +allegro-align-center+ 1)
(defconstant +allegro-align-right+ 2)
(defconstant +allegro-align-integer+ 4)

(defcfun "al_init_font_addon" :void)
(defcfun "al_draw_text" :void
  (font :pointer)
  (r :float) (g :float) (b :float) (a :float)
  (x :float) (y :float)
  (flags :int)
  (ustr :pointer))

;;; ttf.h
(defcfun "al_init_ttf_addon" :boolean)
(defcfun "al_load_ttf_font" :pointer
  (filename :pointer) (size :int) (flags :int))
