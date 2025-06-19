;; Joystick state API example
(ql:quickload "cl-liballegro")                 ; Load the system

(defun get-first-joystick ()
  (let (joystick)
    (cond ((zerop (al:get-num-joysticks))
           (error "No joysticks found!"))
          ((cffi:null-pointer-p (setf joystick (al:get-joystick 0)))
           (error "Error getting joystick!")))
    joystick))

(defun main ()
  (al:init)
  (al:init-font-addon)
  (al:install-joystick)
  (let* ((joystick (get-first-joystick))
         (queue (al:create-event-queue))
         (event (cffi:foreign-alloc '(:union al:event)))
         (window-width  800)
         (window-height 600)
         (display (al:create-display window-width window-height))
         (font (al:create-builtin-font)))
    (al:register-event-source queue (al:get-display-event-source display))
    (al:register-event-source queue (al:get-joystick-event-source))
    (loop :while (loop :named event-loop
                       :while (al:get-next-event queue event)
                       :for type := (cffi:foreign-slot-value event
                                                             '(:union al:event)
                                                             'al::type)
                       :when (eq type :joystick-configuration)
                       :do (al:reconfigure-joysticks)
                           (setf joystick (get-first-joystick))
                       :never (eq type :display-close))
          :for text := ""
          :do
          ;; One can process events :joystick-axis, :joystick-button-down and
          ;; :joystick-button-up, but its also possible to actively poll
          ;; current joystick state:
          (al:with-current-joystick-state joystick-state joystick
            (al:with-joystick-axis (left-stick-horizontal :stick 0 :index 0)
                                   joystick-state
              ;; stick 0 axis 0 corresponds to horizontal axis of left stick
              ;; in Xbox controller, but your mileage may vary
              (unless (zerop left-stick-horizontal)
                (setf text
                      (format nil "~a left stick horizontal axis moved to ~a~%"
                              text
                              left-stick-horizontal))))
            ;; you can also get multiple axes in one go:
            (al:with-joystick-axes ((right-stick-horizontal :stick 1 :index 1)
                                    (right-stick-vertical :stick 2 :index 0))
                                   ;; again, indices are for Xbox controller,
                                   ;; your mileage may vary
                                   joystick-state
              (unless (zerop right-stick-horizontal)
                (setf text
                      (format nil "~a right stick horizontal axis moved to ~a~%"
                              text
                              right-stick-horizontal)))
              (unless (zerop right-stick-vertical)
                (setf text
                      (format nil "~a right stick vertical axis moved to ~a~%"
                              text
                              right-stick-vertical))))
            ;; button indices are for Xbox controller, your mileage may vary
            (al:with-joystick-button (menu :index 7) joystick-state
              (unless (zerop menu)
                (setf text (format nil "~a menu button pressed: ~a~%"
                                   text menu))))
            ;; you can also get multiple buttons in one go:
            (al:with-joystick-buttons ((a :index 0)
                                       (b :index 1)
                                       (x :index 2)
                                       (y :index 3))
                                      joystick-state
              (unless (zerop a)
                (setf text (format nil "~a A button pressed: ~a~%" text a)))
              (unless (zerop b)
                (setf text (format nil "~a B button pressed: ~a~%" text b)))
              (unless (zerop x)
                (setf text (format nil "~a X button pressed: ~a~%" text x)))
              (unless (zerop y)
                (setf text (format nil "~a Y button pressed: ~a~%" text y)))))
          (al:clear-to-color (al:map-rgb 0 0 0))
          (al:draw-multiline-text font (al:map-rgb 255 255 255)
                                  0 0 window-width 8
                                  0 text)
          (al:flip-display))
    (al:destroy-font font)
    (al:destroy-display display)
    (al:destroy-event-queue queue)
    (al:release-joystick joystick)
    (al:uninstall-system)))
