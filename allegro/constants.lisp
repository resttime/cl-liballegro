(in-package #:cl-liballegro)
;;; Display
;; Flags
(defconstant windowed 1)
(defconstant fullscreen 2)
(defconstant opengl 4)
(defconstant direct3d-internal 8)
(defconstant resizable 16)
(defconstant frameless 32)
(defconstant noframe 32)
(defconstant genearate-expose-events 64)
(defconstant opengl-3-0 128)
(defconstant opengl-forward-compatible 256)
(defconstant fullscreen-window 512)
(defconstant minimized 1024)
(defbitfield display-flags
    :windowed
    :fullscreen
    :opengl
    :direct3d-internal
    :resizable
    :frameless
    (:noframe 32)
    :generate-expose-events
    :opengl-3-0
    :opengl-forward-compatible
    :fullscreen-window
    :minimized)
;; Display Options
(defconstant red-size 0)
(defconstant green-size 1)
(defconstant blue-size 2)
(defconstant alpha-size 3)
(defconstant red-shift 4)
(defconstant green-shift 5)
(defconstant blue-shift 6)
(defconstant alpha-shift 7)
(defconstant acc-red-size 8)
(defconstant acc-green-size 9)
(defconstant acc-blue-size 10)
(defconstant acc-alpha-size 11)
(defconstant stereo 12)
(defconstant aux-buffers 13)
(defconstant color-size 14)
(defconstant depth-size 15)
(defconstant stencil-size 16)
(defconstant sample-buffers 17)
(defconstant samples 18)
(defconstant render-method 19)
(defconstant float-color 20)
(defconstant float-depth 21)
(defconstant single-buffer 22)
(defconstant swap-method 23)
(defconstant compatible-display 24)
(defconstant update-display-region 25)
(defconstant vsync 26)
(defconstant max-bitmap-size 27)
(defconstant support-npot-bitmap 28)
(defconstant can-draw-into-bitmap 29)
(defconstant support-separate-alpha 30)
(defconstant display-options-count 31)
(defcenum display-options
  :red-size
  :green-size
  :blue-size
  :alpha-size
  :red-shift
  :green-shift
  :blue-shift
  :alpha-shift
  :acc-red-size
  :acc-green-size
  :acc-blue-size
  :acc-alpha-size
  :stereo
  :aux-buffers
  :color-size
  :depth-size
  :stencil-size
  :sample-buffers
  :samples
  :render-method
  :float-color
  :float-depth
  :single-buffer
  :swap-method
  :compatible-display
  :update-display-region
  :vsync
  :max-bitmap-size
  :support-npot-bitmap
  :can-draw-into-bitmap
  :support-separate-alpha
  :display-options-count)

;; Importance
(defconstant dontcare 0)
(defconstant require 1)
(defconstant suggest 2)
(defcenum importance
  :dontcare
  :require
  :suggest)

;; Display Orientation
(defcenum display-orientation
  :0-degrees
  :90-degrees
  :180-degrees
  :270-degrees
  :face-up
  :face-down)

;;; Events
(defconstant event-joystick-axis 1)
(defconstant event-joystick-button-down 2)
(defconstant event-joystick-button-up 3)
(defconstant event-joystick-configuration 4)
(defconstant event-key-down 10)
(defconstant event-key-char 11)
(defconstant event-key-up 12)
(defconstant event-mouse-axis 20)
(defconstant event-mouse-button-down 21)
(defconstant event-mouse-button-up 22)
(defconstant event-mouse-enter-display 23)
(defconstant event-mouse-leave-display 24)
(defconstant event-mouse-warped 25)
(defconstant event-timer 30)
(defconstant event-display-expose 40)
(defconstant event-display-resize 41)
(defconstant event-display-close 42)
(defconstant event-display-lost 43)
(defconstant event-display-found 44)
(defconstant event-display-switch-in 45)
(defconstant event-display-switch-out 46)
(defconstant event-display-orientation 47)
(defcenum event-types
  (:joystick-axis 1)
  (:joystick-button-down 2)
  (:joystick-button-up 3)
  (:joystick-configuration 4)
  (:key-down 10)
  (:key-char 11)
  (:key-up 12)
  (:mouse-axis 20)
  (:mouse-button-down 21)
  (:mouse-button-up 22)
  (:mouse-enter-display 23)
  (:mouse-leave-display 24)
  (:mouse-warped 25)
  (:timer 30)
  (:display-expose 40)
  (:display-resize 41)
  (:display-close 42)
  (:display-lost 43)
  (:display-found 44)
  (:display-switch-in 45)
  (:display-switch-out 46)
  (:display-orientation 47))
  
;;; Fixed point math
;; Fixed point trig
(defconstant fixtorad-r 1608)
(defconstant radtofix-r 2670177)

;;; Graphics
;; Bitmap flags 
(defconstant memory-bitmap #x0001)
(defconstant keep-bitmap-format #x0002)
(defconstant force-locking #x0004)
(defconstant no-preserve-texture #x0008)
(defconstant alpha-test #x0010)
(defconstant -internal-opengl #x0020)
(defconstant min-linear #x0040)
(defconstant mag-linear #x0080)
(defconstant mipmap #x0100)
(defconstant no-premultiplied-alpha #x0200)
(defconstant video-bitmap #x0400)
(defbitfield bitmap-flags
  (:memory-bitmap #x0001)
  (:keep-bitmap-format #x0002)
  (:force-locking #x0004)
  (:no-preserve-texture #x0008)
  (:alpha-test #x0010)
  (:-internal-opengl #x0020)
  (:min-linear #x0040)
  (:mag-linear #x0080)
  (:mipmap #x0100)
  (:no-premultiplied-alpha #x0200)
  (:video-bitmap #x0400))

;; Flags for blitting functions
(defbitfield draw-flags
  (:flip-horizontal #x00001)
  (:flip-vertical #x00002))
;; Locking flags
(defconstant readwrite 0)
(defconstant readonly 1)
(defconstant writeonly 2)
(defcenum locking-flags
  :readwrite
  :readonly
  :writeonly)
;; Locking and pixel formats
(defcenum pixel-format
  (:any 0)
  :any-no-alpha
  :any-with-alpha
  :any-15-no-alpha
  :any-16-no-alpha
  :any-16-with-alpha
  :any-24-no-alpha
  :any-32-no-alpha
  :any-32-with-alpha
  :argb-8888
  :rgba-8888
  :argb-4444
  :rgb-888
  :rgb-565
  :rgb-555
  :rgba-5551
  :argb-1555
  :abgr-8888
  :xbgr-8888
  :bgr-888
  :bgr-565
  :bgr-555
  :rgbx-8888
  :xrgb-8888
  :abgr-f32
  :abgr-8888-le
  :rgba-4444
  :num-pixel-formats)
(defcenum blend-mode
  :zero
  :one
  :alpha
  :inverse-alpha)
(defcenum blend-operations
  :add
  :src-minus-dest
  :dest-minus-src
  :num-blend-operations)
  
;;; Joystick
(defcenum joyflags
  (:digital #x01)
  (:analogue #x02))
  
;;; Keyboard
;; Keycodes
(defconstant key-a 1)
(defconstant key-b 2)
(defconstant key-c 3)
(defconstant key-d 4)
(defconstant key-e 5)
(defconstant key-f 6)
(defconstant key-g 7)
(defconstant key-h 8)
(defconstant key-i 9)
(defconstant key-j 10)
(defconstant key-k 11)
(defconstant key-l 12)
(defconstant key-m 13)
(defconstant key-n 14)
(defconstant key-o 15)
(defconstant key-p 16)
(defconstant key-q 17)
(defconstant key-r 18)
(defconstant key-s 19)
(defconstant key-t 20)
(defconstant key-u 21)
(defconstant key-v 22)
(defconstant key-w 23)
(defconstant key-x 24)
(defconstant key-y 25)
(defconstant key-z 26)
(defconstant key-0 27)
(defconstant key-1 28)
(defconstant key-2 29)
(defconstant key-3 30)
(defconstant key-4 31)
(defconstant key-5 32)
(defconstant key-6 33)
(defconstant key-7 34)
(defconstant key-8 35)
(defconstant key-9 36)
(defconstant key-pad-0 37)
(defconstant key-pad-1 38)
(defconstant key-pad-2 39)
(defconstant key-pad-3 40)
(defconstant key-pad-4 41)
(defconstant key-pad-5 42)
(defconstant key-pad-6 43)
(defconstant key-pad-7 44)
(defconstant key-pad-8 45)
(defconstant key-pad-9 46)
(defconstant key-f1 47)
(defconstant key-f2 48)
(defconstant key-f3 49)
(defconstant key-f4 50)
(defconstant key-f5 51)
(defconstant key-f6 52)
(defconstant key-f7 53)
(defconstant key-f8 54)
(defconstant key-f9 55)
(defconstant key-f10 56)
(defconstant key-f11 57)
(defconstant key-f12 58)
(defconstant key-escape 59)
(defconstant key-tilde 60)
(defconstant key-minus 61)
(defconstant key-equals 62)
(defconstant key-backspace 63)
(defconstant key-tab 64)
(defconstant key-openbrace 65)
(defconstant key-closebrace 66)
(defconstant key-enter 67)
(defconstant key-semicolon 68)
(defconstant key-quote 69)
(defconstant key-backslash 70)
(defconstant key-backslash2 71)
(defconstant key-comma 72)
(defconstant key-fullstop 73)
(defconstant key-slash 74)
(defconstant key-space 75)
(defconstant key-insert 76)
(defconstant key-delete 77)
(defconstant key-home 78)
(defconstant key-end 79)
(defconstant key-pgup 80)
(defconstant key-pgdn 81)
(defconstant key-left 82)
(defconstant key-right 83)
(defconstant key-up 84)
(defconstant key-down 85)
(defconstant key-pad-slash 86)
(defconstant key-pad-asterisk 87)
(defconstant key-pad-minus 88)
(defconstant key-pad-plus 89)
(defconstant key-pad-delete 90)
(defconstant key-pad-enter 91)
(defconstant key-printscreen 92)
(defconstant key-pause 93)
(defconstant key-abnt-c1 94)
(defconstant key-yen 95)
(defconstant key-kana 96)
(defconstant key-convert 97)
(defconstant key-noconvert 98)
(defconstant key-at 99)
(defconstant key-circumflex 100)
(defconstant key-colon2 101)
(defconstant key-kanji 102)
(defconstant key-pad_equals 103)  
(defconstant key-backquote 104)	
(defconstant key-semicolon2 105)	
(defconstant key-command 106)	
(defconstant key-unknown 107)
(defconstant key-modifiers 215)
(defconstant key-lshift 215)
(defconstant key-rshift 216)
(defconstant key-lctrl 217)
(defconstant key-rctrl 218)
(defconstant key-alt 219)
(defconstant key-altgr 220)
(defconstant key-lwin 221)
(defconstant key-rwin 222)
(defconstant key-menu 223)
(defconstant key-scrolllock 224)
(defconstant key-numlock 225)
(defconstant key-capslock 226)
(defconstant key-max 227)
(defcenum keycodes
  (:a 1)
  (:b 2)
  (:c 3)
  (:d 4)
  (:e 5)
  (:f 6)
  (:g 7)
  (:h 8)
  (:i 9)
  (:j 10)
  (:k 11)
  (:l 12)
  (:m 13)
  (:n 14)
  (:o 15)
  (:p 16)
  (:q 17)
  (:r 18)
  (:s 19)
  (:t 20)
  (:u 21)
  (:v 22)
  (:w 23)
  (:x 24)
  (:y 25)
  (:z 26)
  (:0 27)
  (:1 28)
  (:2 29)
  (:3 30)
  (:4 31)
  (:5 32)
  (:6 33)
  (:7 34)
  (:8 35)
  (:9 36)
  (:pad-0 37)
  (:pad-1 38)
  (:pad-2 39)
  (:pad-3 40)
  (:pad-4 41)
  (:pad-5 42)
  (:pad-6 43)
  (:pad-7 44)
  (:pad-8 45)
  (:pad-9 46)
  (:f1 47)
  (:f2 48)
  (:f3 49)
  (:f4 50)
  (:f5 51)
  (:f6 52)
  (:f7 53)
  (:f8 54)
  (:f9 55)
  (:f10 56)
  (:f11 57)
  (:f12 58)
  (:escape 59)
  (:tilde 60)
  (:minus 61)
  (:equals 62)
  (:backspace 63)
  (:tab 64)
  (:openbrace 65)
  (:closebrace 66)
  (:enter 67)
  (:semicolon 68)
  (:quote 69)
  (:backslash 70)
  (:backslash2 71)
  (:comma 72)
  (:fullstop 73)
  (:slash 74)
  (:space 75)
  (:insert 76)
  (:delete 77)
  (:home 78)
  (:end 79)
  (:pgup 80)
  (:pgdn 81)
  (:left 82)
  (:right 83)
  (:up 84)
  (:down 85)
  (:pad-slash 86)
  (:pad-asterisk 87)
  (:pad-minus 88)
  (:pad-plus 89)
  (:pad-delete 90)
  (:pad-enter 91)
  (:printscreen 92)
  (:pause 93)
  (:abnt-c1 94)
  (:yen 95)
  (:kana 96)
  (:convert 97)
  (:noconvert 98)
  (:at 99)
  (:circumflex 100)
  (:colon2 101)
  (:kanji 102)
  (:pad_equals 103)  
  (:backquote 104)	
  (:semicolon2 105)	
  (:command 106)	
  (:unknown 107)
  (:modifiers 215)
  (:lshift 215)
  (:rshift 216)
  (:lctrl 217)
  (:rctrl 218)
  (:alt 219)
  (:altgr 220)
  (:lwin 221)
  (:rwin 222)
  (:menu 223)
  (:scrolllock 224)
  (:numlock 225)
  (:capslock 226)
  (:key-max 227))

;; Keyboard modifier flags
(defconstant keymod-shift #x00001)
(defconstant keymod-ctrl #x00002)
(defconstant keymod-alt #x00004)
(defconstant keymod-lwin #x00008)
(defconstant keymod-rwin #x00010)
(defconstant keymod-menu #x00020)
(defconstant keymod-altgr #x00040)
(defconstant keymod-command #x00080)
(defconstant keymod-scrolllock #x00100)
(defconstant keymod-numlock #x00200)
(defconstant keymod-capslock #x00400)
(defbitfield keymods
  (:shift #x00001)
  (:ctrl #x00002)
  (:alt #x00004)
  (:lwin #x00008)
  (:rwin #x00010)
  (:menu #x00020)
  (:altgr #x00040)
  (:command #x00080)
  (:scrolllock #x00100)
  (:numlock #x00200)
  (:capslock #x00400))

;;; Mouse
;; Mouse cursors
(defcenum system-mouse-cursor
  (:none         0)
  (:default      1)
  (:arrow        2)
  (:busy         3)
  (:question     4)
  (:edit         5)
  (:move         6)
  (:resize-n     7)
  (:resize-w     8)
  (:resize-s     9)
  (:resize-e    10)
  (:resize-nw   11)
  (:resize-sw   12)
  (:resize-se   13)
  (:resize-ne   14)
  (:progress    15)
  (:precision   16)
  (:link        17)
  (:alt-select  18)
  (:unavailable 19)
  :num-system-mouse-cursors)
 
;;; State
(defbitfield state-flags
  (:new-display-parameters  #x0001)
  (:new-bitmap-parameters   #x0002)
  (:display                 #x0004)
  (:target-bitmap           #x0008)
  (:blender                 #x0010)
  (:new-file-interface      #x0020)
  (:transform               #x0040)
 
  (:bitmap                  10)
  
  (:all                     #xffff))
  
;;; System
(defconstant resources-path 0)
(defconstant temp-path 1)
(defconstant user-data-path 2)
(defconstant user-home-path 3)
(defconstant user-settings-path 4)
(defconstant user-documents-path 5)
(defconstant exename-path 6)
(defconstant last-path 7)
(defcenum path-id
  :resources-path
  :temp-path
  :user-data-path
  :user-home-path
  :user-settings-path
  :user-documents-path
  :exename-path
  :last-path)

;;; Miscellaneous routines
(defconstant +pi+ 3.14159265358979323846)

;;; OpenGL
(defcenum opengl-variant
  :desktop-opengl
  :opengl-es)

;;; Audio addon
(defcenum audio-depth
  (:int8      #x00)
  (:int16     #x01)
  (:int24     #x02)
  (:float32   #x03)

  (:unsigned  #x08)

  (:uint8     #x08)
  (:uint16    #x09)
  (:uint24    #x0A))

(defconstant audio-pan-none -1000.0)

(defcenum channel-conf
  (:1    #x10)
  (:2    #x20)
  (:3    #x30)
  (:4    #x40)
  (:5-1  #x51)
  (:6-1  #x61)
  (:7-1  #x71))

(defcenum mixer-quality
  (:point    #x110)
  (:linear   #x111)
  (:cubic    #x112))

(defcenum playmode
  (:once    #x100)
  (:loop    #x101)
  (:bidir   #x102)
  (:-stream-once    #x103)  
  (:-stream-onedir  #x104))
  
;;; Font
(defconstant align-left 0)
(defconstant align-centre 1)
(defconstant align-center 1)
(defconstant align-right 2)
(defconstant align-integer 4)

(defconstant ttf-no-kerning 1)
(defconstant ttf-monochrome 2)
(defconstant ttf-no-autohint 4)
  
;;; Native Dialogs
(defbitfield filechooser-modes
  :file-must-exist
  :save
  :folder
  :pictures
  :show-hidden
  :multiple)

(defcenum messagebox-flags
  (:warn 1)
  (:error 2)
  (:ok-cancel 4)
  (:yes-no 8)
  (:question 16))
