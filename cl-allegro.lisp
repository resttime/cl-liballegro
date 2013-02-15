(ql:quickload "cffi")
(defpackage :allegro
  (:use :common-lisp :cffi)
  (:export "+ALLEGRO-VERSION+"
           "+ALLEGRO-SUB-VERSION+"
           "+ALLEGRO-WIP-VERSION+"
           "+ALLEGRO-RELEASE-NUMBER+"
           "+ALLEGRO-VERSION-INT+"
           "+ALLEGRO-PI+"
           "AL-LOAD-BITMAP"
           "AL-GET-ALLEGRO-VERSION"
           "ALLEGRO-COLOR"
           "AL-INSTALL-SYSTEM"
           "AL-UNINSTALL-SYSTEM"
           "AL-IS-SYSTEM-INSTALLED"
           "AL-INIT"
           "+ALLEGRO-WINDOWED+" 
           "+ALLEGRO-FULLSCREEN+" 
           "+ALLEGRO-OPENGL+" 
           "+ALLEGRO-DIRECT3D-INTERNAL+" 
           "+ALLEGRO-RESIZABLE+" 
           "+ALLEGRO-FRAMELESS+" 
           "+ALLEGRO-NOFRAME+" 
           "+ALLEGRO-GENERATE-EXPOSE-EVENTS+" 
           "+ALLEGRO-OPENGL-3-0+" 
           "+ALLEGRO-OPENGL-FORWARD-COMPATIBLE+" 
           "+ALLEGRO-FULLSCREEN-WINDOW+" 
           "+ALLEGRO-MINIMIZED+" 
           "AL-CREATE-DISPLAY" 
           "AL-DESTROY-DISPLAY" 
           "AL-FLIP-DISPLAY" 
           "AL-SET-NEW-DISPLAY-FLAGS" 
           "AL-CLEAR-TO-COLOR" 
           "AL-GET-DISPLAY-EVENT-SOURCE" 
           "AL-SET-TARGET-BITMAP" 
           "AL-GET-BACKBUFFER" 
           "AL-REST"
           "AL-INIT-TIMEOUT"
           "AL-INIT-IMAGE-ADDON"
           "AL-INIT-PRIMITIVES-ADDON"
           "+ALLEGRO-EVENT-JOYSTICK-AXIS+"
           "+ALLEGRO-EVENT-JOYSTICK-BUTTON-DOWN+"
           "+ALLEGRO-EVENT-JOYSTICK-BUTTON-UP+"
           "+ALLEGRO-EVENT-JOYSTICK-CONFIGURATION+"
           "+ALLEGRO-EVENT-KEY-DOWN+"
           "+ALLEGRO-EVENT-KEY-CHAR+"
           "+ALLEGRO-EVENT-KEY-UP+"
           "+ALLEGRO-EVENT-MOUSE-AXES+"
           "+ALLEGRO-EVENT-MOUSE-BUTTON-DOWN+"
           "+ALLEGRO-EVENT-MOUSE-BUTTON-UP+"
           "+ALLEGRO-EVENT-MOUSE-ENTER-DISPLAY+"
           "+ALLEGRO-EVENT-MOUSE-LEAVE-DISPLAY+"
           "+ALLEGRO-EVENT-MOUSE-WARPED+"
           "+ALLEGRO-EVENT-TIMER+"
           "+ALLEGRO-EVENT-DISPLAY-EXPOSE+"
           "+ALLEGRO-EVENT-DISPLAY-RESIZE+"
           "+ALLEGRO-EVENT-DISPLAY-CLOSE+"
           "+ALLEGRO-EVENT-DISPLAY-LOST+"
           "+ALLEGRO-EVENT-DISPLAY-FOUND+"
           "+ALLEGRO-EVENT-DISPLAY-SWITCH-IN+"
           "+ALLEGRO-EVENT-DISPLAY-SWITCH-OUT+"
           "+ALLEGRO-EVENT-DISPLAY-ORIENTATION+"
           "ALLEGRO-EVENT-TYPE"
           "TYPE"
           "SOURCE"
           "TIMESTAMP"
           "WIDTH"
           "HEIGHT"
           "ORIENTATION"
           "ID"
           "STICK"
           "AXIS"
           "POS"
           "BUTTON"
           "DISPLAY"
           "KEYCODE"
           "UNICHAR"
           "MODIFIERS"
           "REPEAT"
           "X"
           "Y"
           "Z"
           "W"
           "DX"
           "DY"
           "DZ"
           "DW"
           "PRESSURE"
           "COUNT"
           "ERROR"
           "--INTERNAL--DESCR"
           "DATA"
           "DATA2"
           "DATA3"
           "DATA4"
           "ANY"
           "JOYSTICK"
           "KEYBOARD"
           "MOUSE"
           "TIMER"
           "USER"
           "ALLEGRO-EVENT-TYPE-IS-USER"
           "ALLEGRO-EVENT-SOURCE"
           "ALLEGRO-ANY-EVENT"
           "ALLEGRO-DISPLAY-EVENT"
           "ALLEGRO-EVENT-QUEUE"
           "ALLEGRO-ANY-EVENT"
           "ALLEGRO-DISPLAY-EVENT"
           "ALLEGRO-JOYSTICK-EVENT"
           "ALLEGRO-KEYBOARD-EVENT"
           "ALLEGRO-MOUSE-EVENT"
           "ALLEGRO-TIMER-EVENT"
           "ALLEGRO-USER-EVENT"
           "ALLEGRO-EVENT"
           "AL-CREATE-EVENT-QUEUE"
           "AL-DESTROY-EVENT-QUEUE"
           "AL-REGISTER-EVENT-SOURCE"
           "AL-IS-EVENT-QUEUE-EMPTY"
           "AL-WAIT-FOR-EVENT"
           "AL-WAIT-FOR-EVENT-UNTIL"
           "AL-CREATE-TIMER"
           "AL-DESTROY-TIMER"
           "AL-START-TIMER"
           "AL-GET-TIMER-EVENT-SOURCE"
           "+ALLEGRO-FLIP-HORIZONTAL+"
           "+ALLEGRO-FLIP-VERTICAL+"
           "ALLEGRO-BITMAP"
           "AL-CREATE-BITMAP"
           "AL-DESTROY-BITMAP" 
           "AL-DRAW-BITMAP"
           "AL-DRAW-TINTED-BITMAP"
           "AL-DRAW-ROTATED-BITMAP"
           "AL-LOAD-BITMAP" 
           "AL-GET-BITMAP-WIDTH"
           "AL-GET-BITMAP-HEIGHT"
           "AL-IS-MOUSE-INSTALLED"
           "AL-INSTALL-MOUSE"
           "AL-UNINSTALL-MOUSE"
           "AL-GET-MOUSE-EVENT-SOURCE"
           "WITH-MOUSE-SLOTS"
           "+ALLEGRO-KEY-A+"
           "+ALLEGRO-KEY-B+"
           "+ALLEGRO-KEY-C+"
           "+ALLEGRO-KEY-D+"
           "+ALLEGRO-KEY-E+"
           "+ALLEGRO-KEY-F+"
           "+ALLEGRO-KEY-G+"
           "+ALLEGRO-KEY-H+"
           "+ALLEGRO-KEY-I+"
           "+ALLEGRO-KEY-J+"
           "+ALLEGRO-KEY-K+"
           "+ALLEGRO-KEY-L+"
           "+ALLEGRO-KEY-M+"
           "+ALLEGRO-KEY-N+"
           "+ALLEGRO-KEY-O+"
           "+ALLEGRO-KEY-P+"
           "+ALLEGRO-KEY-Q+"
           "+ALLEGRO-KEY-R+"
           "+ALLEGRO-KEY-S+"
           "+ALLEGRO-KEY-T+"
           "+ALLEGRO-KEY-U+"
           "+ALLEGRO-KEY-V+"
           "+ALLEGRO-KEY-W+"
           "+ALLEGRO-KEY-X+"
           "+ALLEGRO-KEY-Y+"
           "+ALLEGRO-KEY-Z+"
           "+ALLEGRO-KEY-0+"
           "+ALLEGRO-KEY-1+"
           "+ALLEGRO-KEY-2+"
           "+ALLEGRO-KEY-3+"
           "+ALLEGRO-KEY-4+"
           "+ALLEGRO-KEY-5+"
           "+ALLEGRO-KEY-6+"
           "+ALLEGRO-KEY-7+"
           "+ALLEGRO-KEY-8+"
           "+ALLEGRO-KEY-9+"
           "+ALLEGRO-KEY-PAD-0+"
           "+ALLEGRO-KEY-PAD-1+"
           "+ALLEGRO-KEY-PAD-2+"
           "+ALLEGRO-KEY-PAD-3+"
           "+ALLEGRO-KEY-PAD-4+"
           "+ALLEGRO-KEY-PAD-5+"
           "+ALLEGRO-KEY-PAD-6+"
           "+ALLEGRO-KEY-PAD-7+"
           "+ALLEGRO-KEY-PAD-8+"
           "+ALLEGRO-KEY-PAD-9+"
           "+ALLEGRO-KEY-F1+"
           "+ALLEGRO-KEY-F2+"
           "+ALLEGRO-KEY-F3+"
           "+ALLEGRO-KEY-F4+"
           "+ALLEGRO-KEY-F5+"
           "+ALLEGRO-KEY-F6+"
           "+ALLEGRO-KEY-F7+"
           "+ALLEGRO-KEY-F8+"
           "+ALLEGRO-KEY-F9+"
           "+ALLEGRO-KEY-F10+"
           "+ALLEGRO-KEY-F11+"
           "+ALLEGRO-KEY-F12+"
           "+ALLEGRO-KEY-ESCAPE+"
           "+ALLEGRO-KEY-TILDE+"
           "+ALLEGRO-KEY-MINUS+"
           "+ALLEGRO-KEY-EQUALS+"
           "+ALLEGRO-KEY-BACKSPACE"
           "+ALLEGRO-KEY-TAB"
           "+ALLEGRO-KEY-ENTER+"
           "+ALLEGRO-KEY-SPACE+"
           "+ALLEGRO-KEY-LEFT+"
           "+ALLEGRO-KEY-RIGHT+"
           "+ALLEGRO-KEY-UP+"
           "+ALLEGRO-KEY-DOWN+"
           "+ALLEGRO-KEY-MODIFIERS"
           "+ALLEGRO-KEY-LSHIFT+"
           "+ALLEGRO-KEY-RSHIFT+"
           "+ALLEGRO-KEY-LCTRL+"
           "+ALLEGRO-KEY-RCTRL+"
           "+ALLEGRO-KEY-ALT+"
           "+ALLEGRO-KEY-ALTGR+"
           "+ALLEGRO-KEY-LWIN+"
           "+ALLEGRO-KEY-RWIN+"
           "+ALLEGRO-KEY-MENU+"
           "+ALLEGRO-KEY-SCROLLLOCK+"
           "+ALLEGRO-KEY-NUMLOCK+"
           "+ALLEGRO-KEY-CAPSLOCK+"
           "+ALLEGRO-KEYMOD-SHIFT+"
           "+ALLEGRO-KEYMOD-CTRL+"
           "+ALLEGRO-KEYMOD-ALT+"
           "+ALLEGRO-KEYMOD-LWIN+"
           "+ALLEGRO-KEYMOD-RWIN+"
           "AL-IS-KEYBOARD-INSTALLED"
           "AL-INSTALL-KEYBOARD"
           "AL-UNINSTALL-KEYBOARD"
           "AL-GET-KEYBOARD-EVENT-SOURCE"
           "GET-EVENT-TYPE"
           "GET-KEYBOARD"
           "GET-MOUSE"
           "WITH-KEYBOARD-SLOTS"
           "WITH-ALLEGRO-EVENT"
           "AL-INIT-ACODEC-ADDON"
           "AL-GET-ALLEGRO-ACODEC-VERSION"
           "+ALLEGRO-PLAYMODE-ONCE+"
           "+ALLEGRO-PLAYMODE-LOOP+"
           "+ALLEGRO-PLAYMODE-LOOP-BIDIR+"
           "+-ALLEGRO-PLAYMODE-STREAM-ONCE+"
           "+-ALLEGRO-PLAYMODE-STREAM-ONEDIR+"
           "+ALLEGRO-MIXER-QUALITY-POINT+"
           "+ALLEGRO-MIXER-QUALITY-LINEAR+"
           "+ALLEGRO-MIXER-QUALITY-CUBIC+"
           "ALLEGRO-SAMPLE"
           "ALLEGRO-SAMPLE-ID"
           "AL-IS-AUDIO-INSTALLED"
           "AL-INSTALL-AUDIO"
           "AL-UNINSTALL-AUDIO"
           "AL-DESTROY-SAMPLE"
           "AL-PLAY-SAMPLE"
           "AL-RESERVE-SAMPLES"
           "AL-LOAD-SAMPLE"
           "+ALLEGRO-ALIGN-LEFT+"
           "+ALLEGRO-ALIGN-CENTRE+"
           "+ALLEGRO-ALIGN-CENTER+"
           "+ALLEGRO-ALIGN-RIGHT+"
           "+ALLEGRO-ALIGN-INTEGER+"
           "AL-INIT-FONT-ADDON"
           "AL-DRAW-TEXT"
           "AL-INIT-TTF-ADDON"
           "AL-LOAD-TTF-FONT"))

(in-package :allegro)

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
