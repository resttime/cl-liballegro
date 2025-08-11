(ql:quickload "cl-liballegro")

(in-package :cl-user)

(defconstant +NUM-BUTTONS+ 5)
(defvar *ACTUAL-BUTTONS* 0)

(defun draw-mouse-button (but down)
  (let ((offset (make-array +NUM-BUTTONS+ :element-type 'integer :initial-contents #(0 70 35 105 140) :adjustable nil))
        (grey (al:map-rgb #xe0 #xe0 #xe0))
        (black (al:map-rgb 0 0 0))
        (x)
        (y 130))
    
    (setf x (+ 400 (aref offset but)))

    (al:draw-filled-rectangle x y (+ x 27) (+ y 42) grey)
    (al:draw-rectangle (+ x 0.5) (+ y 0.5) (+ x 26.5) (+ y 41.5) black 0)
    (when down
      (al:draw-filled-rectangle (+ x 2) (+ y 2) (+ x 25) (+ y 40) black))))

(defun main ()
  (let ((display)
        (cursor)
        (queue)
        (event (cffi:foreign-alloc '(:union al:event)))
        (font)
        (mx 0)
        (my 0)
        (mz 0)
        (mw 0)
        (mmx 0)
        (mmy 0)
        (mmz 0)
        (mmw 0)
        (precision 1)
        (in t)
        (buttons (make-array +NUM-BUTTONS+ :element-type 'boolean :initial-element nil :adjustable nil))
        (p 0.0)
        (black (al:map-rgb-f 0 0 0))
        (add (cffi:foreign-enum-value 'al::blend-operations ':add))
        (one (cffi:foreign-enum-value 'al::blend-mode ':one))
        (inverse-alpha (cffi:foreign-enum-value 'al::blend-mode ':inverse-alpha)))
    
    (unwind-protect
         (progn
           (if (not (al:init))
               (abort-example "Could not init Allegro.~&"))

           (al:init-primitives-addon)
           (al:install-mouse)
           (al:install-keyboard)
           (al:init-image-addon)
           (al:init-font-addon)
           (init-platform-specific)

           (setf *ACTUAL-BUTTONS* (al:get-mouse-num-buttons))
           (if (> *ACTUAL-BUTTONS* +NUM-BUTTONS+)
               (setf *ACTUAL-BUTTONS* +NUM-BUTTONS+))

           (al:set-new-display-flags '(:resizable))
           (setf display (al:create-display 640 480))
           (if (cffi:null-pointer-p display)
               (abort-example "Error creating display.~&"))
           (unwind-protect
                (progn
                  (al:resize-display display (round (* 640 1.5)) (round (* 480 1.5)))
                  (al:hide-mouse-cursor display)

                  (setf cursor (al:load-bitmap (namestring (asdf:system-relative-pathname
                                                            "cl-liballegro" "examples/data/cursor.tga"))))
                  (if (cffi:null-pointer-p cursor)
                      (abort-example "Error loading cursor.tga~&"))
                  (unwind-protect
                       (progn
                         (setf font (al:load-font (namestring (asdf:system-relative-pathname
                                                               "cl-liballegro" "examples/data/fixed-font.tga"))
                                                  1 0))
                         (if (cffi:null-pointer-p font)
                             (abort-example "data/fixed-font.tga not found.~&"))
                         (unwind-protect
                              (progn
                                (setf queue (al:create-event-queue))
                                (unwind-protect
                                     (progn
                                       (al:register-event-source queue (al:get-mouse-event-source))
                                       (al:register-event-source queue (al:get-keyboard-event-source))
                                       (al:register-event-source queue (al:get-display-event-source display))

                                       (loop named main-loop do
                                         (if (al:is-event-queue-empty queue)
                                             (progn
                                               (al:clear-to-color (al:map-rgb #xff #xff #xc0))
                                               (loop for i from 0 below *ACTUAL-BUTTONS* do
                                                 (draw-mouse-button i (aref buttons i)))
                                               (al:draw-bitmap cursor mx my 0)
                                               (al:set-blender add one inverse-alpha)
                                               (al:draw-text font black 5 5 0 (format nil "dx ~d, dy ~d, dz ~d, dw ~d"
                                                                                      mmx mmy mmz mmw))
                                               (al:draw-text font black 5 25 0 (format nil "x ~d, y ~d, z ~d, w ~d"
                                                                                       mx my mz mw))
                                               (al:draw-text font black 5 45 0 (format nil "p = ~d" p))
                                               (al:draw-text font black 5 65 0 (format nil "~a" (if in "in" "out")))
                                               (al:draw-text font black 5 85 0 (format nil "wheel precision (PgUp/PgDn) ~d" precision))
                                               (al:set-blender add one inverse-alpha)
                                               (setf mmx 0 mmy 0 mmz 0)
                                               (al:flip-display)))
                                         
                                         (al:wait-for-event queue event)
                                         (case (cffi:foreign-slot-value event '(:union al:event) 'al::type)
                                           (:mouse-axis
                                            (setf mx (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::x))
                                            (setf my (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::y))
                                            (setf mz (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::z))
                                            (setf mw (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::w))
                                            (setf mmx (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::dx))
                                            (setf mmy (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::dy))
                                            (setf mmz (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::dz))
                                            (setf mmw (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::dw))
                                            (setf p (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::pressure)))

                                           (:mouse-button-down
                                            (let ((btn (1- (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::button))))
                                              (if (< btn +NUM-BUTTONS+)
                                                  (setf (aref buttons btn) t)))
                                            (setf p (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::pressure)))
                                           
                                           (:mouse-button-up
                                            (let ((btn (1- (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::button))))
                                              (if (< btn +NUM-BUTTONS+)
                                                  (setf (aref buttons btn) nil)))
                                            (setf p (cffi:foreign-slot-value event '(:struct al:mouse-event) 'al::pressure)))
                                           
                                           (:mouse-enter-display (setf in t))
                                           
                                           (:mouse-leave-display (setf in nil))
                                           
                                           (:key-down
                                            (if (equal (cffi:foreign-slot-value event '(:struct al:keyboard-event) 'al::keycode)
                                                       ':escape)
                                                (return-from main-loop)))
                                           
                                           (:key-char
                                            (let ((key (cffi:foreign-slot-value event '(:struct al:keyboard-event) 'al::keycode)))
                                              (if (equal key ':pgup)
                                                  (progn
                                                    (incf precision 1)
                                                    (al:set-mouse-wheel-precision precision))
                                                  (if (equal key ':pgdn)
                                                      (progn
                                                        (decf precision 1)
                                                        (if (< precision 1)
                                                            (setf precision 1))
                                                        (al:set-mouse-wheel-precision precision))))))
                                           
                                           (:display-resize
                                            (al:acknowledge-resize (cffi:foreign-slot-value event '(:struct al:display-event) 'al::source)))
                                           
                                           (:display-close (return-from main-loop)))))
                                  (al:destroy-event-queue queue)))
                           (al:destroy-font font)))
                    (al:destroy-bitmap cursor)))
             (al:destroy-display display)))
      (cffi:foreign-free event))))
