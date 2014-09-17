(in-package #:cl-liballegro)

;;; Any events
(defun event-type-of (event)
  (cffi:foreign-slot-value event '(:union al:event) 'al::type))
(defun event-struct-type-of (event)
  (case (event-type-of event)
    ((:joystick-axis 
      :joystick-button-down 
      :joystick-button-up 
      :joystick-configuration) :joystick-event)
    ((:key-down 
      :key-char 
      :key-up) :keyboard-event)
    ((:mouse-axis 
      :mouse-button-down
      :mouse-button-up
      :mouse-enter-display
      :mouse-leave-display
      :mouse-warped) :mouse-event)
    (:timer :timer-event)
    ((:display-expose 
      :display-resize 
      :display-close 
      :display-lost 
      :display-found 
      :display-switch-in 
      :display-switch-out 
      :display-switch-orientation) :display-event)))
(defun cffi-event-struct-type-of (event)
  (list :struct (find-symbol (string (event-struct-type-of event)))))

;;; Shared Events
(defun display-of (event)
  "Used for both keyboard and mouse events."
  (cffi:foreign-slot-value event (cffi-event-struct-type-of event) 'al::display))
(defun x-of (event)
  "Used for both display and mouse events."
  (cffi:foreign-slot-value event (cffi-event-struct-type-of event) 'al::x))
(defun y-of (event)
  "Used for both display and mouse events."
  (cffi:foreign-slot-value event (cffi-event-struct-type-of event) 'al::y))
(defun button-of (event)
  "Used for both joystick and mouse events."
  (cffi:foreign-slot-value event (cffi-event-struct-type-of event) 'al::button))

;;; Joystick Events
(defun id-of (joystick-event)
  (cffi:foreign-slot-value joystick-event '(:struct al:joystick-event) 'al::id))
(defun stick-of (joystick-event)
  (cffi:foreign-slot-value joystick-event '(:struct al:joystick-event) 'al::stick))
(defun axis-of (joystick-event)
  (cffi:foreign-slot-value joystick-event '(:struct al:joystick-event) 'al::axis))
(defun pos-of (joystick-event)
  (cffi:foreign-slot-value joystick-event '(:struct al:joystick-event) 'al::pos))


;;; Display events
(defun width-of (display-event)
  (cffi:foreign-slot-value display-event '(:struct al:display-event) 'al::width))
(defun height-of (display-event)
  (cffi:foreign-slot-value display-event '(:struct al:display-event) 'al::height))
(defun orientation-of (display-event)
  (cffi:foreign-slot-value display-event '(:struct al:display-event)
			   'al::orientation))

;;; Keyboard Events
(defun keycode-of (keyboard-event)
  (cffi:foreign-slot-value keyboard-event '(:struct al:keyboard-event) 'al::keycode))
(defun unichar-of (keyboard-event)
  (cffi:foreign-slot-value keyboard-event '(:struct al:keyboard-event) 'al::unichar))
(defun modifiers-of (keyboard-event)
  (cffi:foreign-slot-value keyboard-event '(:struct al:keyboard-event)
			   'al::modifiers))
(defun repeat-of (keyboard-event)
  (cffi:foreign-slot-value keyboard-event '(:struct al:keyboard-event) 'al::repeat))
