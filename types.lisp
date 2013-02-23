(in-package #:cl-liballegro)

;;; Default
(define-foreign-type c-float ()
  ()
  (:actual-type :float)
  (:simple-parser c-float))
(defmethod translate-to-foreign (value (type c-float)) (float value 0f0))

(define-foreign-type c-double ()
  ()
  (:actual-type :double)
  (:simple-parser c-double))
(defmethod translate-to-foreign (value (type c-double)) (float value 0d0))

(define-foreign-type c-int ()
  ()
  (:actual-type :int)
  (:simple-parser c-int))
(defmethod translate-to-foreign (value (type c-int)) (truncate value))

;;; Configuration Files
(defcstruct allegro-config)

;;; Display
(defcstruct allegro-display)

;;; Events
(defctype allegro-event-type :uint)

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

;;; File I/O
(defcstruct allegro-file)
(defcstruct alegro-file-interface)

;;; File system routines
(defcstruct allegro-fs-entry)

;;; Fixed point math
(defctype fixed :int32)

;;; Fullscreen modes
(defcstruct allegro-display-mode
  (width :int)
  (height :int)
  (format :int)
  (refresh-rate :int))
  
;;; Graphics
;; Bitmap Creation
(defcstruct allegro-bitmap)

;;; Joystick
(defcstruct allegro-joystick)
(defcstruct allegro-joystick-state)

;;; Keyboard
(defcstruct allegro-keyboard-state)

;;; Monitor
(defcstruct allegro-monitor-info
  (x1 :int)
  (y1 :int)
  (x2 :int)
  (y2 :int))

;;; Mouse
(defcstruct allegro-mouse-state)

;;; State
(defcstruct allegro-state)

;;; Time
(defcstruct allegro-timeout)

;;; Timer
(defcstruct allegro-timer)

;;; Transformations
(defcstruct allegro-transform)

;;; Audio addon
(defcstruct allegro-mixer)

(defcstruct allegro-audio-stream)
(defcstruct allegro-voice)

;;; Font addons
(defcstruct allegro-font)

;;; Native dialogs support
(defcstruct allegro-filechooser)
(defcstruct allegro-textlog)
