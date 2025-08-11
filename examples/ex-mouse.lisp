(ql:quickload "cl-liballegro")

(in-package :cl-user)

(defconstant +NUM-BUTTONS+ 4)

(defun draw-mouse-button (but down)
  (let ((offset (make-array +NUM-BUTTONS+ :element-type 'integer :initial-contents #(0 135 70 35) :adjustable nil))
        (grey (al:map-rgb #xe0 #xe0 #xe0))
        (black (al:map-rgb 0 0 0))
        (x)
        (y 130))
    
    (setf x (+ 400 (aref offset (1- but))))

    (al:draw-filled-rectangle x y (+ x 27) (+ y 42) grey)
    (al:draw-rectangle (+ x 0.5) (+ y 0.5) (+ x 26.5) (+ y 41.5) black 0)
    (when down
      (al:draw-filled-rectangle (+ x 2) (+ y 2) (+ x 25) (+ y 40) black))))

(defun main ()
  (let ((display)
        (cursor)
        (msestate (cffi:foreign-alloc '(:struct al::mouse-state)))
        (kbdstate (cffi:foreign-alloc '(:struct al:keyboard-state))))

    (unwind-protect
         (if (not (al:init))
             (abort-example "Could not init Allegro~&"))
      
      (al:init-primitives-addon)
      (al:install-mouse)
      (al:install-keyboard)
      (al:init-image-addon)
      (init-platform-specific)

      (setf display (al:create-display 640 480))
      (if (cffi:null-pointer-p display)
          (abort-example "Error creating display~&"))
      (al:clear-keyboard-state display)
      
      (unwind-protect                   ;deallocate display
           (al:hide-mouse-cursor display)

        (setf cursor (al:load-bitmap (namestring (asdf:system-relative-pathname
                                                  "cl-liballegro" "examples/data/cursor.tga"))))
        (if (cffi:null-pointer-p cursor)
            (abort-example "Error loading cursor.tga~&"))

        (unwind-protect                 ;deallocate cursor
             (loop initially (al:get-keyboard-state kbdstate)
                   while (not (al:key-down kbdstate (cffi:foreign-enum-value 'al::keycodes :escape)))
                   do
                      (al:get-mouse-state msestate)
                      (al:clear-to-color (al:map-rgb #xff #xff #xc0))
                      (loop
                        for i from 1 below +NUM-BUTTONS+ do
                          (draw-mouse-button i (al:mouse-button-down msestate i)))
                      (al:draw-bitmap cursor
                                      (cffi:foreign-slot-value msestate '(:struct al:mouse-state) 'al::x)
                                      (cffi:foreign-slot-value msestate '(:struct al:mouse-state) 'al::y)
                                      0)
                      (al:flip-display)
                      (al:rest-time 0.005)
                      (al:get-keyboard-state kbdstate))
          (al:destroy-bitmap cursor))
        (al:destroy-display display))
      (cffi:foreign-free kbdstate)
      (cffi:foreign-free msestate))))
