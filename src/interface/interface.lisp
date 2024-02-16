;;;; Higher Level Interface
(in-package #:cl-liballegro)

(defclass display-settings ()
  ((width :initform 800 :initarg :width :reader width)
   (height :initform 600 :initarg :height :reader height)
   (title :initarg :title :initform "Allegro5 Window" :reader title)
   (display-flags :initarg :display-flags :initform 0 :reader display-flags)
   (display-options :initarg :display-options :initform '() :reader display-options)))

(defclass system (display-settings)
  ((event-queue :accessor event-queue)
   (display :accessor display)
   (event :reader event :initform (cffi:foreign-alloc '(:union al:event)))
   (system-loop-running-p :accessor system-loop-running-p :initform t)
   (system-time :accessor system-time)
   (new-time :accessor new-time)
   (frame-time :accessor frame-time)
   (accumulator :accessor accumulator :initform 0.0)
   (logic-fps :accessor logic-fps :initarg :logic-fps :initform 30)))

(defmacro with-event (event &body body)
  `(let ((,event (cffi:foreign-alloc '(:union al:event))))
     ,@body
     (cffi:foreign-free event)))

;;; Initializations
(defgeneric initialize-event-queue (system)
  (:method (system)
    (setf (event-queue system) (al:create-event-queue))))
(defgeneric initialize-display (system)
  (:method (system)
    (al:set-new-display-flags (display-flags system))
    (loop for (option val importance) in (display-options system) do
      (al:set-new-display-option option val importance))
    (setf (display system) (al:create-display (width system) (height system)))
    (al:set-window-title (display system) (title system))
    (al:register-event-source (event-queue system)
                              (al:get-display-event-source (display system)))))
(defgeneric initialize-mouse (system)
  (:method (system)
    (al:install-mouse)
    (al:register-event-source (event-queue system) (al:get-mouse-event-source))))
(defgeneric initialize-keyboard (system)
  (:method (system)
    (al:install-keyboard)
    (al:register-event-source (event-queue system) (al:get-keyboard-event-source))))

;;; Generic Handlers
(defgeneric joystick-axis-handler (system) (:method (system)))
(defgeneric joystick-button-down-handler (system) (:method (system)))
(defgeneric joystick-button-up-handler (system) (:method (system)))
(defgeneric joystick-configuration-handler (system) (:method (system)))
(defgeneric key-down-handler (system)
  (:method (system)
    (print (cffi:foreign-slot-value (al:event system)
                                    '(:struct al:keyboard-event)
                                    'al::keycode))))
(defgeneric key-char-handler (system) (:method (system)))
(defgeneric key-up-handler (system) (:method (system)))
(defgeneric mouse-axis-handler (system) (:method (system)))
(defgeneric mouse-button-down-handler (system) (:method (system)))
(defgeneric mouse-button-up-handler (system) (:method (system)))
(defgeneric mouse-enter-display-handler (system) (:method (system)))
(defgeneric mouse-leave-display-handler (system) (:method (system)))
(defgeneric mouse-warped-handler (system) (:method (system)))
(defgeneric timer-handler (system) (:method (system)))
(defgeneric display-expose-handler (system) (:method (system)))
(defgeneric display-resize-handler (system)
  (:method (system)
    (al:acknowledge-resize (display system))))
(defgeneric display-close-handler (system)
  (:method (system)
    (setf (system-loop-running-p system) nil)))
(defgeneric display-lost-handler (system) (:method (system)))
(defgeneric display-found-handler (system) (:method (system)))
(defgeneric display-switch-in-handler (system) (:method (system)))
(defgeneric display-switch-out-handler (system) (:method (system)))
(defgeneric display-switch-orientation-handler (system) (:method (system)))
(defgeneric event-handler (system)
  (:method (system)
    (case (cffi:foreign-slot-value (event system) '(:union al:event) 'al::type)
      (:joystick-axis (joystick-axis-handler system))
      (:joystick-button-down (joystick-button-down-handler system))
      (:joystick-button-up (joystick-button-up-handler system))
      (:joystick-configuration (joystick-configuration-handler system))
      (:key-down (key-down-handler system))
      (:key-char (key-char-handler system))
      (:key-up (key-up-handler system))
      (:mouse-axis (mouse-axis-handler system))
      (:mouse-button-down (mouse-button-down-handler system))
      (:mouse-button-up (mouse-button-up-handler system))
      (:mouse-enter-display (mouse-enter-display-handler system))
      (:mouse-leave-display (mouse-leave-display-handler system))
      (:mouse-warped (mouse-warped-handler system))
      (:timer (timer-handler system))
      (:display-expose (display-expose-handler system))
      (:display-resize (display-resize-handler system))
      (:display-close (display-close-handler system))
      (:display-lost (display-lost-handler system))
      (:display-found (display-found-handler system))
      (:display-switch-in (display-switch-in-handler system))
      (:display-switch-out (display-switch-out-handler system))
      (:display-switch-orientation (display-switch-orientation-handler system)))))

(defgeneric process-event-queue (system)
  (:method (system)
    (loop while (al:get-next-event (event-queue system) (event system)) do
      (event-handler system))))

(defgeneric update (system) (:method (system)))
(defgeneric render (system)
  (:method (system)
    (al:clear-to-color (al:map-rgb 0 0 0))
    (al:flip-display)))

(defgeneric system-loop (system)
  (:method (system)
    (with-slots (system-time new-time frame-time accumulator logic-fps) system
      (loop while (system-loop-running-p system)
            with lpt = (/ 1.0 logic-fps)
            do
               (setf new-time (get-time))
               (setf frame-time (- new-time system-time))
               (when (> frame-time lpt)
                 (setf frame-time lpt))
               (setf system-time new-time)
               (incf accumulator frame-time)
               (loop while (>= accumulator lpt) do
                 (process-event-queue system)
                 (update system)
                 (decf accumulator lpt))
               (render system)))))

(defgeneric initialize-system (system)
  (:method (system)
    (trivial-garbage:gc :full t)
    (al:init)
    (setf (system-time system) (al:get-time))
    (al:init-image-addon)
    (al:init-font-addon)
    (al:init-ttf-addon)
    (al:install-audio)
    (al:restore-default-mixer)
    (al:init-acodec-addon)
    (initialize-event-queue system)
    (initialize-display system)
    (initialize-mouse system)
    (initialize-keyboard system)))

(defgeneric shutdown-system (system)
  (:method (system)
    (al:destroy-display (display system))
    (al:destroy-event-queue (event-queue system))
    (al:stop-samples)
    (cffi:foreign-free (event system))
    (trivial-garbage:gc :full t)))

(defun %run-system (system)
  (initialize-system system)
  (unwind-protect (system-loop system)
    (shutdown-system system)))

#-darwin
(defgeneric run-system (system)
  (:method (system)
    (float-features:with-float-traps-masked t
      (%run-system system))))

#+darwin
(let ((main-system))
  (defcallback run-system-main :void () (%run-system main-system))

  (defgeneric run-system (system)
    (:method (system)
      (setf main-system system)
      (trivial-main-thread:with-body-in-main-thread ()
        (float-features:with-float-traps-masked t
          (run-main 0 (null-pointer) (callback run-system-main)))))))
