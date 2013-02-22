(in-package #:cl-liballegro)

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
  
;;; Events
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

;;; File I/O
(defcenum allegro-seek
  (:allegro-seek-set 0)
  :allegro-seek-cur
  :allegro-seek-end)
  
;;; File system routines
(defbitfield allegro-file-mode
  (:allegro-filemode-read #x00001)
  (:allegro-filemode-write)
  (:allegro-filemode-execute)
  (:allegro-filemode-hidden)
  (:allegro-filemode-isfile)
  (:allegro-filemode-isdir))
  
;;; Fixed point math
;; Fixed point trig
(defconstant fixtorad-r 1608)
(defconstant radtofix-r 2670177)

;;; Graphics
;; Locking and pixel formats
(defcstruct allegro-locked-region
  (data :pointer)
  (format :int)
  (pitch :int)
  (pixel-size :int))
(defcenum allegro-pixel-format
  (:allegro-pixel-format-any 0)
  :allegro-pixel-format-any-no-alpha
  :allegro-pixel-format-any-with-alpha
  :allegro-pixel-format-any-15-no-alpha
  :allegro-pixel-format-any-16-no-alpha
  :allegro-pixel-format-any-16-with-alpha
  :allegro-pixel-format-any-24-no-alpha
  :allegro-pixel-format-any-32-no-alpha
  :allegro-pixel-format-any-32-with-alpha
  :allegro-pixel-format-argb-8888
  :allegro-pixel-format-rgba-8888
  :allegro-pixel-format-argb-4444
  :allegro-pixel-format-rgb-888
  :allegro-pixel-format-rgb-565
  :allegro-pixel-format-rgb-555
  :allegro-pixel-format-rgba-5551
  :allegro-pixel-format-argb-1555
  :allegro-pixel-format-abgr-8888
  :allegro-pixel-format-xbgr-8888
  :allegro-pixel-format-bgr-888
  :allegro-pixel-format-bgr-565
  :allegro-pixel-format-bgr-555
  :allegro-pixel-format-rgbx-8888
  :allegro-pixel-format-xrgb-8888
  :allegro-pixel-format-abgr-f32
  :allegro-pixel-format-abgr-8888-le
  :allegro-pixel-format-rgba-4444
  :allegro-num-pixel-formats)
  
;;; Joystick
(defcenum allegro-joyflags
  (:allegro-joyflag-digital #x01)
  (:allegro-joyflag-analogue #x02))
  
;;; Keyboard
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

;;; Mouse
;; Mouse cursors
(defcenum allegro-system-mouse-cursor
  (:allegro-system-mouse-cursor-none         0)
  (:allegro-system-mouse-cursor-default      1)
  (:allegro-system-mouse-cursor-arrow        2)
  (:allegro-system-mouse-cursor-busy         3)
  (:allegro-system-mouse-cursor-question     4)
  (:allegro-system-mouse-cursor-edit         5)
  (:allegro-system-mouse-cursor-move         6)
  (:allegro-system-mouse-cursor-resize-n     7)
  (:allegro-system-mouse-cursor-resize-w     8)
  (:allegro-system-mouse-cursor-resize-s     9)
  (:allegro-system-mouse-cursor-resize-e    10)
  (:allegro-system-mouse-cursor-resize-nw   11)
  (:allegro-system-mouse-cursor-resize-sw   12)
  (:allegro-system-mouse-cursor-resize-se   13)
  (:allegro-system-mouse-cursor-resize-ne   14)
  (:allegro-system-mouse-cursor-progress    15)
  (:allegro-system-mouse-cursor-precision   16)
  (:allegro-system-mouse-cursor-link        17)
  (:allegro-system-mouse-cursor-alt-select  18)
  (:allegro-system-mouse-cursor-unavailable 19)
  :allegro-num-system-mouse-cursors)
 
;;; State
(defcenum allegro-state-flags
  (:allegro-state-new-display-parameters  #x0001)
  (:allegro-state-new-bitmap-parameters   #x0002)
  (:allegro-state-display                 #x0004)
  (:allegro-state-target-bitmap           #x0008)
  (:allegro-state-blender                 #x0010)
  (:allegro-state-new-file-interface      #x0020)
  (:allegro-state-transform               #x0040)
 
  (:allegro-state-bitmap                  10)
  
  (:allegro-state-all                     #xffff))

;;; Miscellaneous routines
(defconstant +allegro-pi+ 3.14159265358979323846)

;;; Audio addon
(defcenum allegro-audio-depth
  (:allegro-audio-depth-int8      #x00)
  (:allegro-audio-depth-int16     #x01)
  (:allegro-audio-depth-int24     #x02)
  (:allegro-audio-depth-float32   #x03)

  (:allegro-audio-depth-unsigned  #x08)

  (:allegro-audio-depth-uint8     #x08)
  (:allegro-audio-depth-uint16    #x09)
  (:allegro-audio-depth-uint24    #x0A))

(defcenum allegro-channel-conf
  (:allegro-channel-conf-1    #x10)
  (:allegro-channel-conf-2    #x20)
  (:allegro-channel-conf-3    #x30)
  (:allegro-channel-conf-4    #x40)
  (:allegro-channel-conf-5-1  #x51)
  (:allegro-channel-conf-6-1  #x61)
  (:allegro-channel-conf-7-1  #x71))

(defcenum allegro-mixer-quality
  (:allegro-mixer-quality-point    #x110)
  (:allegro-mixer-quality-linear   #x111)
  (:allegro-mixer-quality-cubic    #x112))

(defcenum allegro-playmode
  (:allegro-playmode-once    #x100)
  (:allegro-playmode-loop    #x101)
  (:allegro-playmode-bidir   #x102)
  (:-allegro-playmode-stream-once    #x103)  
  (:-allegro-playmode-stream-onedir  #x104))
  
;;; Font addons
(defconstant +allegro-align-left+ 0)
(defconstant +allegro-align-centre+ 1)
(defconstant +allegro-align-center+ 1)
(defconstant +allegro-align-right+ 2)
(defconstant +allegro-align-integer+ 4)