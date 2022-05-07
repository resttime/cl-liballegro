;;; Video player for .ogv files
(ql:quickload "cl-liballegro")

(defvar *screen*)
(defvar *font*)
(defvar *filename* "")
(defparameter *zoom* nil)

(defun video-display (video)
  (let (;; Videos often do not use square pixels - these return the
        ;; scaled dimensions of the video frame.
        (scaled-w (al:get-video-scaled-width video))
        (scaled-h (al:get-video-scaled-height video))
        ;; Get the currently visible frame of the video, based on clock
        ;; time.
        (frame (al:get-video-frame video))
        (w) (h) (x) (y)
        (tc (al:map-rgba-f 0 0 0 0.5))
        (bc (al:map-rgba-f 0.5 0.5 0.5 0.5))
        (p))

    ;; Return if there's no frame
    (when (cffi:null-pointer-p frame)
      (return-from video-display))

    ;; Set width and height depending on zoom
    (if (eq *zoom* nil)
        (progn
          (setf h (al:get-display-height *screen*))
          (setf w (/ (* h scaled-w) scaled-h))
          (if (> w (al:get-display-width *screen*))
              (setf w (al:get-display-width *screen*))
              (setf h (/ (* w scaled-h) scaled-w))))
        (progn
          (setf w scaled-w)
          (setf h scaled-h)))

    ;; Coordinates we're drawing to
    (setf x (/ (- (al:get-display-width *screen*) w) 2))
    (setf y (/ (- (al:get-display-height *screen*) h) 2))

    ;; Display the frame
    (al:draw-scaled-bitmap frame 0 0
                           (al:get-bitmap-width frame)
                           (al:get-bitmap-height frame)
                           x y w h 0)
    ;; Show video info
    (al:draw-filled-rounded-rectangle 4 4
                                      (- (al:get-display-width *screen*) 4) (+ 4 (* 14 4))
                                      8 8 bc)
    (setf p (al:get-video-position video :actual))
    (al:draw-text *font* tc 8 8 0 *filename*)
    (al:draw-text *font* tc 8 (+ 8 13) 0
                  (format nil "~3d:~2,'0d (V: ~5,2@f A: ~5,2@f)"
                          (floor (/ p 60)) (floor (mod p 60))
                          (- (al:get-video-position video :video-decode) p)
                          (- (al:get-video-position video :audio-decode) p)))
    (al:draw-text *font* tc 8 (+ 8 (* 13 2)) 0
                  (format nil "video rate ~,2f (~dx~d, aspect ~,1f) audio rate ~,0f"
                          (al:get-video-fps video)
                          (al:get-bitmap-width frame)
                          (al:get-bitmap-height frame)
                          (/ scaled-w scaled-h)
                          (al:get-video-audio-rate video)))
    (al:draw-text *font* tc 8 (+ 8 (* 13 3)) 0
                  (format nil "playing: ~:[true~;false~]" (al:is-video-playing video)))

    ;; Render to *screen*
    (al:flip-display)
    (al:clear-to-color (al:map-rgb 0 0 0))))

(defun play (f)
  (setf *filename* f)
  (format t "usage: (play FILENAME)~%  only supports ogv files~%~%")
  (format t "space: play/pause~%z: zoom~%esc/q: quit~%")
  ;; Initialize allegro
  (al:init)
  (al:init-font-addon)
  (al:init-primitives-addon)
  (al:init-video-addon)
  (al:install-keyboard)
  (al:install-audio)
  (al:reserve-samples 1)

  ;; Create display
  (al:set-new-display-flags '(:resizable))
  (al:set-new-display-option :vsync 1 :suggest)
  (setf *screen* (al:create-display 800 600))

  ;; Create font
  (setf *font* (al:create-builtin-font))

  ;; Set bitmap flags
  (al:set-new-bitmap-flags '(:min-linear :mag-linear))
  (let ((video (al:open-video "output.ogv"))
        (queue (al:create-event-queue))
        (event (cffi:foreign-alloc '(:union al:event)))
        (redraw t))
    ;; Register events
    (al:register-event-source queue (al:get-video-event-source video))
    (al:register-event-source queue (al:get-display-event-source *screen*))
    (al:register-event-source queue (al:get-keyboard-event-source))
    ;; Start video
    (al:start-video video (al:get-default-mixer))
    (loop (when (and redraw (al:is-event-queue-empty queue))
            (video-display video)
            (setf redraw nil))
          (al:wait-for-event queue event)
          (case (cffi:foreign-slot-value event '(:union al:event) 'al::type)
            (:key-down
             (case (cffi:foreign-slot-value event '(:struct al:keyboard-event)
                                            'al::keycode)
               (:space (al:set-video-playing video (not (al:is-video-playing video))))
               ((:q :escape) (return))
               (:z (setf *zoom* (not *zoom*)))))
            (:display-resize
             (al:acknowledge-resize *screen*)
             (al:clear-to-color (al:map-rgb 0 0 0)))
            (:display-close (return))
            (:video-frame-show (setf redraw t))
            (:finished)))
    (al:close-video video)
    (cffi:foreign-free event))
  ;; All done!
  (al:destroy-display *screen*)
  (al:uninstall-system))
