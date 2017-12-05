(in-package #:cl-liballegro)

;;; Default
(define-foreign-type c-float ()
  ()
  (:actual-type :float)
  (:simple-parser c-float))
(defmethod translate-to-foreign (value (type c-float)) (float value 0f0))
(defmethod translate-into-foreign-memory (value (type c-float) pointer)
  (translate-into-foreign-memory (translate-to-foreign value type)
                                 (make-instance 'cffi::foreign-built-in-type
                                                :type-keyword :float)
                                 pointer))

(define-foreign-type c-double ()
  ()
  (:actual-type :double)
  (:simple-parser c-double))
(defmethod translate-to-foreign (value (type c-double)) (float value 0d0))
(defmethod translate-into-foreign-memory (value (type c-double) pointer)
  (translate-into-foreign-memory (translate-to-foreign value type)
                                 (make-instance 'cffi::foreign-built-in-type
                                                :type-keyword :double)
                                 pointer))

(define-foreign-type c-int ()
  ()
  (:actual-type :int)
  (:simple-parser c-int))
(defmethod translate-to-foreign (value (type c-int)) (truncate value))
(defmethod translate-into-foreign-memory (value (type c-int) pointer)
  (translate-into-foreign-memory (translate-to-foreign value type)
                                 (make-instance 'cffi::foreign-built-in-type
                                                :type-keyword :int)
                                 pointer))

(define-foreign-type c-ptr ()
  ()
  (:actual-type :pointer)
  (:simple-parser c-ptr))
(defmethod translate-to-foreign (value (type c-ptr))
  (if (or (eql value 0) (eq value nil))
      (null-pointer)
      value))
(defmethod translate-into-foreign-memory (value (type c-ptr) pointer)
  (translate-into-foreign-memory (translate-to-foreign value type)
                                 (make-instance 'cffi::foreign-built-in-type
                                                :type-keyword :pointer)
                                 pointer))

;;; Events
(defctype event-type event-types)

(defcstruct any-event
  (type event-type) (source :pointer) (timestamp :double))
(defcstruct display-event
  (type event-type) (source :pointer) (timestamp :double)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (orientation :int))
(defcstruct joystick-event
  (type event-type) (source :pointer) (timestamp :double)
  (id :pointer)
  (stick :int)
  (axis :int)
  (pos :float)
  (button :int))
(defcstruct keyboard-event
  (type event-type) (source :pointer) (timestamp :double)
  (display :pointer)
  (keycode keycodes)
  (unichar :int)
  (modifiers keymods)
  (repeat :boolean))
(defcstruct mouse-event
  (type event-type) (source :pointer) (timestamp :double)
  (display :pointer)
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
(defcstruct timer-event
  (type event-type) (source :pointer) (timestamp :double)
  (count :int64)
  (error :double))
(defcstruct touch-event
  (type event-type) (source :pointer) (timestamp :double)
  (display :pointer)
  (id :int)
  (x :int)
  (y :int)
  (dx :int)
  (dy :int)
  (primary :bool))
(defcstruct user-event
  (type event-type) (source :pointer) (timestamp :double)
  (--internal--descr :pointer)
  (data1 (:pointer :int))
  (data2 (:pointer :int))
  (data3 (:pointer :int))
  (data4 (:pointer :int)))
(defcunion event
  (type event-type)
  (any (:struct any-event))
  (display (:struct display-event))
  (joystick (:struct joystick-event))
  (keyboard (:struct keyboard-event))
  (mouse (:struct mouse-event))
  (timer (:struct timer-event))
  (touch (:struct touch-event))
  (user (:struct user-event)))

(defcstruct (event-source :size 128))
(defcstruct event-queue)

;;; File I/O
(defcstruct file)
(defcstruct alegro-file-interface)

;;; File system routines
(defcstruct fs-entry)

;;; Fixed point math
(defctype fixed :int32)

;;; Fullscreen modes
(defcstruct display-mode
  (width :int)
  (height :int)
  (format :int)
  (refresh-rate :int))

;;; Graphics
;; Colors
(defcstruct color
  (r :float)
  (g :float)
  (b :float)
  (a :float))

;; Locking and Pixel Formats
(defcstruct locked-region
  (data :pointer)
  (format :int)
  (pitch :int)
  (pixel-size :int))

;; Bitmap Creation
(defcstruct bitmap
  (vt :pointer)
  (display :pointer)
  (format :int)
  (flags :int)
  (w :int)
  (h :int)
  (pitch :int)
  (cl :int)
  (cr-excl :int)
  (ct :int)
  (cb-excl :int)
  (locked :boolean)
  (lock-x :int)
  (lock-y :int)
  (lock-w :int)
  (lock-h :int)
  (lock-flags :int)
  ;(locked-region locked-region)
  ;(transform transform)
  (parent :pointer)
  (xofs :int)
  (yofs :int)
  (memory :pointer)
  (size :uint)
  (preserve-texture :boolean))

;;; Joystick
(defcstruct joystick)
(defcstruct joystick-state)

;;; Keyboard
(defcstruct keyboard-state
  (display :pointer)
  (--key-down--internal--
   :uint :count #.(floor (/ (+ (foreign-enum-value 'keycodes :key-max) 31)
                            32))))

(defmacro with-keyboard-state (state &body body)
  `(with-foreign-object (,state '(:struct keyboard-state))
     ,@body))

(defmacro with-current-keyboard-state (state &body body)
  `(with-keyboard-state ,state
     (al:get-keyboard-state ,state)
     ,@body))

;;; Monitor
(defcstruct monitor-info
  (x1 :int)
  (y1 :int)
  (x2 :int)
  (y2 :int))

;;; Mouse
(defcstruct mouse-state
  (x :int)
  (y :int)
  (z :int)
  (w :int)
  (more-axis :int :count #.+mouse-max-extra-axes+)
  (buttons :int)
  (pressure :float)
  (display :pointer))

(defmacro with-mouse-state (state &body body)
  `(with-foreign-object (,state '(:struct mouse-state))
     ,@body))

(defmacro with-current-mouse-state (state &body body)
  `(with-mouse-state ,state
     (al:get-mouse-state ,state)
     ,@body))

;;; State
(defcstruct state)

;;; Time
(defcstruct timeout)

;;; Timer
(defcstruct timer)

;;; Transformations
(defcstruct transform)

;;; Audio addon
(defcstruct mixer)

(defcstruct audio-stream)
(defcstruct voice)

;;; Font addons
(defcstruct font)

;;; Native dialogs support
(defcstruct filechooser)
(defcstruct textlog)
