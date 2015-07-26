(in-package #:cl-liballegro)
;;; Display
;; Flags
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
  
;;; File I/O
(defcenum seek
  (:seek-set 0)
  (:seek-cur)
  (:seek-end))

;;; Fixed point math
;; Fixed point trig
(defconstant +fixtorad-r+ 1608)
(defconstant +radtofix-r+ 2670177)

;;; Graphics
;; Bitmap flags 
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

(defconstant +audio-pan-none+ -1000.0)

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
(defcenum align-flags
  (:left 0)
  (:centre 1)
  (:center 1)
  (:right 2)
  (:integer 4))

(defbitfield ttf-flags
  :no-kerning
  :monochrome
  :no-autohint) 

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
