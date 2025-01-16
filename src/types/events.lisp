(in-package #:cl-liballegro)

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
(defcstruct audio-recorder-event
  (type event-type) (source :pointer) (timestamp :double)
  (--internal--desc :pointer)
  (buffer :pointer)
  (samples :uint))
(defcunion event
  (type event-type)
  (any (:struct any-event))
  (display (:struct display-event))
  (joystick (:struct joystick-event))
  (keyboard (:struct keyboard-event))
  (mouse (:struct mouse-event))
  (timer (:struct timer-event))
  (touch (:struct touch-event))
  (user (:struct user-event))
  (audio-record-event (:struct audio-recorder-event)))

(defcstruct (event-source :size 128))
(defcstruct event-queue)

(defmacro with-event (event &body body)
  `(with-foreign-object (,event '(:union event))
     ,@body))

(defun %foreign-slot-spec (requested-slots all-slots)
  (if requested-slots
      (loop :for slot :in requested-slots
            :collecting
               (etypecase slot
                 (symbol
                  `(,slot ,(intern (string slot) :cl-liballegro)))
                 (cons
                  (destructuring-bind (variable-name slot-name) slot
                    `(,variable-name
                      ,(intern (string slot-name) :cl-liballegro))))))
      (mapcar
       (lambda (slot)
         `(,(intern (string slot) *package*) ,slot))
       all-slots)))

(defmacro with-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(type source timestamp))
        ,event (:struct any-event))
     ,@body))

(defmacro with-display-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(x y width height orientation))
        ,event (:struct display-event))
     ,@body))

(defmacro with-joystick-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(id stick axis pos button))
        ,event (:struct joystick-event))
     ,@body))

(defmacro with-keyboard-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(display keycode unichar modifiers repeat))
        ,event (:struct keyboard-event))
     ,@body))

(defmacro with-mouse-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(x y z w dx dy dz dw button pressure))
        ,event (:struct mouse-event))
     ,@body))

(defmacro with-timer-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(count error))
        ,event (:struct timer-event))
     ,@body))

(defmacro with-touch-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(display id x y dx dy primary))
        ,event (:struct touch-event))
     ,@body))

(defmacro with-user-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(data1 data2 data3 data4))
        ,event (:struct user-event))
     ,@body))

(defmacro with-audio-recorder-event-slots ((&rest slots) event &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(buffer samples))
        ,event (:struct audio-recorder-event))
     ,@body))
