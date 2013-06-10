(defpackage #:cl-liballegro
  (:use #:cl #:cffi)
  (:nicknames #:al #:liballegro)
  (:export 
;;; Higher level Lisp API
   ;; CLOS type and slots
   #:system
   #:width
   #:height
   #:title
   #:display-flags
   #:display-options
   #:event-queue
   #:display
   #:event
   #:system-running-p
   ;; Generic Initialization Methods
   #:initialize-event-queue
   #:initialize-display
   #:initialize-mouse
   #:initialize-keyboard
   ;; Generic Event Handler Methods
   #:joystick-axis-handler
   #:joystick-button-down-handler
   #:joystick-button-up-handler
   #:joystick-configuration-handler
   #:key-down-handler
   #:key-char-handler
   #:key-up-handler
   #:mouse-axis-handler
   #:mouse-button-down-handler
   #:mouse-button-up-handler
   #:mouse-enter-display-handler
   #:mouse-leave-display-handler
   #:mouse-warped-handler
   #:timer-handler
   #:display-expose-handler
   #:display-resize-handler
   #:display-close-handler
   #:display-lost-handler
   #:display-found-handler
   #:display-switch-in-handler
   #:display-switch-out-handler
   #:display-switch-orientation-handler
   #:event-handler
   ;; Generic Event Processer
   #:process-event-queue
   ;; Generic System Loop
   #:system-loop
   ;; Generic System Runner
   #:run-system
   
;;; Configuration Files
   #:create-config
   #:destroy-config
   #:load-config-file
   #:load-config-file-f
   #:save-config-file
   #:save-config-file-f
   #:add-config-section
   #:remove-config-section
   #:add-config-comment
   #:get-config-value
   #:set-config-value
   #:get-first-config-section
   #:get-next-config-section
   #:get-first-config-entry
   #:get-next-config-entry
   #:merge-config
   #:merge-config-into

;;; Display
   ;; Display Creation
   #:create-display
   #:destroy-display
   #:set-new-display-flags
   #:get-new-display-flags
   #:set-new-display-flags 
   #:set-new-display-option
   #:set-new-display-option
   #:reset-new-display-options
   #:get-new-window-positong
   #:set-new-window-position
   #:get-new-display-refresh-rate
   #:set-new-display-refresh-rate
   
   ;; Display Operations
   #:get-display-event-source
   #:get-backbuffer
   #:flip-display
   #:update-display-region
   #:wait-for-vsync

   ;; Display size and position
   #:get-display-width
   #:get-display-height
   #:resize-display
   #:acknowledge-resize
   #:get-window-position
   #:set-window-position

   ;; Display Settings
   #:get-display-flags
   #:get-display-flag
   #:toggle-display-flag
   #:get-display-option
   #:get-display-format
   #:get-display-refresh-rate
   #:set-window-title
   #:set-display-icon
   #:set-display-icons

   ;; Screensaver
   #:inhibit-screensaver
   
;;; Events
   #:event-joystick-axis
   #:event-joystick-button-down
   #:event-joystick-button-up
   #:event-joystick-configuration
   #:event-key-down
   #:event-key-char
   #:event-key-up
   #:event-mouse-axes
   #:event-mouse-button-down
   #:event-mouse-button-up
   #:event-mouse-enter-display
   #:event-mouse-leave-display
   #:event-mouse-warped
   #:event-timer
   #:event-display-expose
   #:event-display-resize
   #:event-display-close
   #:event-display-lost
   #:event-display-found
   #:event-display-switch-in
   #:event-display-switch-out
   #:event-display-orientation
  
   #:any-event
   #:display-event
   #:joystick-event
   #:keyboard-event
   #:mouse-event
   #:timer-event
   #:user-event
   #:event

   #:create-event-queue
   #:destroy-event-queue
   #:register-event-source
   #:unregister-event-source
   #:is-event-queue-empty
   #:get-next-event
   #:peek-next-event
   #:drop-next-event
   #:flush-event-queue
   #:wait-for-event
   #:wait-for-event-timed
   #:wait-for-event-until
   #:init-user-event-source
   #:destroy-user-event-source
   #:emit-user-event
   #:unref-user-event
   #:get-event-source-data
   #:set-event-source-date

;;; File I/O
   #:fopen

;;; File system routines
   #:create-fs-entry
   #:destroy-fs-entry

;;; Fixed point math
   #:itofix
   #:fixtoi
   #:fixfloor
   #:fixceil
   #:ftofix
   #:fixtof
   #:fixmul
   #:fixdiv
   #:fixadd
   #:fixsub

   ;; Fixed point trig
   #:fixsin
   #:fixcos
   #:fixtan
   #:fixasin
   #:fixacos
   #:fixatan
   #:fixatan2
   #:fixasqrt
   #:fixhypot

;;; Fullscreen modes
   #:get-display-mode
   #:get-num-display-modes
   
;;; Graphics
   ;; Color
   #:map-rgb

   ;; Locking and pixel formats
   #:get-pixel-size
   #:get-pixel-format-bits
   #:lock-bitmap
   #:lock-bitmap-region
   #:unlock-butmap
   
   ;; Bitmap Creation
   #:create-bitmap
   #:create-sub-bitmap
   #:clone-bitmap
   #:destroy-bitmap
   #:get-new-bitmap-flags
   #:get-new-bitmap-format
   #:set-new-bitmap-flags
   #:add-new-bitmap-flag
   #:set-new-bitmap-format

   ;; Bitmap properties
   #:get-bitmap-flags
   #:get-bitmap-format
   #:get-bitmap-height
   #:get-bitmap-width
   #:is-bitmap-locked
   #:is-compatible-bitmap
   #:is-sub-bitmap
   #:get-parent-bitmap

   ;; Drawing Operations
   #:clear-to-color
   #:draw-bitmap
   #:draw-tinted-bitmap
   #:draw-bitmap-region
   #:draw-tinted-bitmap-region
   #:draw-pixel
   #:draw-rotated-bitmap
   #:draw-tinted-rotated-bitmap
   #:draw-scaled-rotated-bitmap
   #:draw-tinted-scaled-rotated-bitmap
   #:draw-tinted-scaled-rotated-bitmap-region
   #:draw-scaled-bitmap
   #:draw-tinted-scaled-bitmap
   #:get-target-bitmap
   #:put-pixel
   #:put-blended-pixel
   #:set-target-bitmap
   #:set-target-backbuffer
   #:get-current-display

   ;; Blending modes
   #:get-blender
   #:get-separate-blender
   #:set-blender
   #:set-separate-blender

   ;; Clipping
   #:get-clippng-rectangle
   #:set-clippng-rectangle
   #:reset-clipping-rectangle

   ;; Graphics utility functions
   #:convert-mask-to-alpha

   ;; Deferred drawing
   #:hold-bitmap-drawing
   #:is-bitmap-drawing-held
   
   ;; Images I/O
   #:register-bitmap-loader
   #:resiter-bitmap-saver
   #:registe-bitmap-loader-f
   #:register-bitmap-saver-f
   #:load-bitmap
   #:load-bitmap-f
   #:save-bitmap
   #:save-bitmap-f

;;; Joystick
   #:install-joystick
   #:unisntall-joystick
   #:is-joystick-installed
   #:reconfigure-joysticks
   #:get-num-joysticks
   #:get-joystick
   #:release-joystick
   #:get-joystick-active
   #:get-joystick-name
   #:get-joystick-stick-name
   #:get-joystick-axis-name
   #:get-joystick-button-name
   #:get-joystick-stick-flags
   #:get-joystick-num-sticks
   #:get-joystick-num-axes
   #:get-joystick-num-buttons
   #:get-joystick-state
   #:get-joystick-event-source
   
;;; Keyboard
   ;; Key codes
   #:key-a
   #:key-b
   #:key-c
   #:key-d
   #:key-e
   #:key-f
   #:key-g
   #:key-h
   #:key-i
   #:key-j
   #:key-k
   #:key-l
   #:key-m
   #:key-n
   #:key-o
   #:key-p
   #:key-q
   #:key-r
   #:key-s
   #:key-t
   #:key-u
   #:key-v
   #:key-w
   #:key-x
   #:key-y
   #:key-z

   #:key-0
   #:key-1
   #:key-2
   #:key-3
   #:key-4
   #:key-5
   #:key-6
   #:key-7
   #:key-8
   #:key-9

   #:key-pad-0
   #:key-pad-1
   #:key-pad-2
   #:key-pad-3
   #:key-pad-4
   #:key-pad-5
   #:key-pad-6
   #:key-pad-7
   #:key-pad-8
   #:key-pad-9

   #:key-f1
   #:key-f2
   #:key-f3
   #:key-f4
   #:key-f5
   #:key-f6
   #:key-f7
   #:key-f8
   #:key-f9
   #:key-f10
   #:key-f11
   #:key-f12

   #:key-escape
   #:key-tilde
   #:key-minus
   #:key-equals
   #:key-backspace
   #:key-tab
   #:key-openbrace
   #:key-closebrace
   #:key-enter
   #:key-semicolon
   #:key-quote
   #:key-backslash
   #:key-backslash2
   #:key-comma
   #:key-fullstop
   #:key-slash
   #:key-space

   #:key-insert
   #:key-delete
   #:key-home
   #:key-end
   #:key-pgup
   #:key-pgdn
   #:key-left
   #:key-right
   #:key-up
   #:key-down

   #:key-pad-slash
   #:key-pad-asterisk
   #:key-pad-minus
   #:key-pad-plus
   #:key-pad-delete
   #:key-pad-enter

   #:key-printscreen
   #:key-pause
   
   #:key-modifiers
   #:key-lshift
   #:key-rshift
   #:key-lctrl
   #:key-rctrl
   #:key-alt
   #:key-altgr
   #:key-lwin
   #:key-rwin
   #:key-menu
   #:key-scrolllock
   #:key-numlock
   #:key-capslock
   
   ;;Keyboard modifier flags
   #:keymod-shift
   #:keymod-ctrl
   #:keymod-alt
   #:keymod-lwin
   #:keymod-rwin
   #:keymod-menu
   #:keymod-altgr
   #:keymod-command
   #:keymod-scrolllock
   #:keymod-numlock
   #:keymod-capslock
   
   #:install-keyboard
   #:is-keyboard-installed
   #:uninstall-keyboard
   #:get-keyboard-state
   #:key-down
   #:keycode-to-name
   #:set-keyboard-leds
   #:get-keyboard-event-source

;;; Monitor
   #:get-new-display-adapter
   #:set-new-display-adapter
   #:get-monitor-info
   #:get-num-video-adapters
   
;;; Mouse
   #:install-mouse
   #:is-mouse-installed
   #:uninstall-mouse
   #:get-mouse-num-axes
   #:get-mouse-num-buttons
   #:get-mouse-state
   #:get-mouse-state-axis
   #:get-mouse-button-down
   #:set-mouse-xy
   #:set-mouse-z
   #:set-mouse-w
   #:set-mouse-axis
   #:get-mouse-event-source

   ;; Mouse cursors
   #:create-mouse-cursor
   #:destroy-mouse-cursor
   #:set-mouse-cursor
   #:set-system-mouse-cursor
   #:get-mouse-cursor-position
   #:hide-mouse-cursor
   #:show-mouse-cursor
   #:grab-mouse
   #:ungrab-mouse
   
;;; Path
   #:create-path
   #:create-path-for-directory
   #:destroy-path
   #:clone-path
   #:join-paths
   #:rebase-path
   #:get-path-drive
   #:get-path-num-components
   #:get-path-component
   #:get-path-tail
   #:get-path-filename
   #:get-path-bsename
   #:get-path-extension
   #:set-path-drive
   #:append-path-component
   #:insert-path-component
   #:replace-path-componenet
   #:remove-parth-component
   #:drop-path-tail
   #:set-path-filename
   #:set-path-extension
   #:path-cstr
   #:make-path-canonical

;;; State
   #:restore-state
   #:store-state
   #:get-errno
   #:set-errno

;;; System
   #:install-system
   #:init
   #:get-allegro-version
   #:uninstall-system
   #:is-system-installed
   #:get-allegro-version
   #:get-stadard-path
   #:set-exe-name
   #:set-app-name
   #:set-org-name
   #:get-app-name
   #:get-org-name
   #:get-system-config
   #:register-assert-handler

;;; Time
   #:get-time
   #:current-time
   #:init-timeout
   #:rest-time

;;; Timer
   #:create-timer
   #:start-timer
   #:stop-timer
   #:get-timer-started
   #:destroy-timer
   #:get-timer-count
   #:set-timer-count
   #:add-timer-count
   #:get-timer-speed
   #:set-timer-speed
   #:get-timer-event-source

;;; Transformations
   #:copy-transform
   #:use-transform
   #:get-current-transform
   #:invert-transform
   #:check-inverse
   #:identity-transform
   #:build-transform
   #:translate-transform
   #:rotate-transform
   #:scale-transform
   #:transform-coordinates
   #:compose-transform
   
;;; Miscellaneous routines
   #:+pi+

;;; OpenGL
   #:get-opengl-extension-list
   #:get-opengl-proc-address
   #:get-opengl-texture
   #:get-opengl-texture-size
   #:get-opengl-texture-position
   #:get-opengl-texture-fbo
   #:remove-opengl-texture-fbo
   #:have-opengln-extension
   #:get-opengl-version
   #:get-opengl-variant
   #:set-current-opengl-context

;;; Audio addon
   ;; Setting up audio
   #:install-audio
   #:uninstall-audio
   #:is-audio-installed
   #:reserve-samples

   ;; Misc audio functions
   #:get-allegro-audio-version
   #:get-audio-depth-size
   #:get-channel-count

   ;; Voice functions
   #:create-voice
   #:destroy-voice
   #:detach-voice
   #:attach-audio-stream-to-voice
   #:attach-mixer-to-voice
   #:attach-sample-instance-to-voice
   #:get-voice-frequency
   #:get-voice-channels
   #:get-voice-depth
   #:get-voice-playing
   #:set-voice-playing
   #:get-voice-position
   #:set-voice-position

   ;; Sample functions
   #:create-sample
   #:destroy-sample
   #:play-sample
   #:stop-sample
   #:stop-samples
   #:get-sample-channels
   #:get-sample-depth
   #:get-sample-frequency
   #:get-sample-length
   #:get-sample-data

   ;; Sample instance functions
   #:create-smaple-instance
   #:destroy-sample-instance
   #:play-sample-instance
   #:stop-sample-instance
   #:get-sample-instance-channels
   #:get-sample-instance-depth
   #:get-sample-instance-frequency
   #:get-sample-instance-length
   #:set-sample-instance-length
   #:get-sample-instance-position
   #:set-sample-instance-position
   #:get-sample-instance-speed
   #:set-sample-instance-speed
   #:get-sample-instance-gain
   #:set-sample-instance-gain
   #:get-sample-instance-pan
   #:set-sample-instance-pan
   #:get-sample-instance-time
   #:get-sample-instance-playmode
   #:set-sample-instance-playmode
   #:get-sample-instance-playing
   #:set-sample-instance-playing
   #:get-sample-instance-attached
   #:detach-sample-instance
   #:get-sample
   #:set-sample

   ;; Mixer functions
   #:create-mixer
   #:destroy-mixer
   #:get-default-mixer
   #:set-default-mixer
   #:restore-default-mixer
   #:attach-mixer-to-mixer
   #:attach-sample-instance-to-mixer
   #:attach-audio-stream-to-mixer
   #:get-mixer-frequency
   #:set-mixer-frequency
   #:get-mixer-channels
   #:get-mixer-depth
   #:get-mixer-gain
   #:set-mixer-gain
   #:get-mixer-quality
   #:set-mixer-quality
   #:get-mixer-playing
   #:set-mixer-playing
   #:get-mixer-attached
   #:detach-mixer
   #:set-mixer-postprocess-callback

   ;; Stream functions
   #:create-audio-stream
   #:destroy-audio-stream
   #:get-audio-stream-event-source
   #:drain-audio-stream
   #:rewind-audio-stream
   #:get-audio-stream-frequency
   #:get-audio-stream-channels
   #:get-audio-stream-depth
   #:get-audio-stream-length
   #:get-audio-stream-speed
   #:set-audio-strema-speed
   #:get-audio-stream-gain
   #:set-audio-stream-gain
   #:get-audio-stream-pan
   #:set-audio-stream-pan
   #:get-audio-stream-playing
   #:set-audio-stream-playing
   #:get-audio-stream-playmode
   #:set-audio-stream-playmode
   #:get-audio-stream-attached
   #:detach-audio-stream
   #:get-audio-stream-fragment
   #:set-audio-stream-fragment
   #:get-audio-stream-fragments
   #:get-available-audio-stream-fragments
   #:seek-audio-stream-secs
   #:get-audio-stream-position-secs
   #:get-audio-stream-length-secs
   #:set-audio-stream-loop-secs
   
   ;; Audio file I/O
   #:register-sample-loader
   #:register-sample-loader-f
   #:register-sample-saver
   #:register-sample-saver-f
   #:register-audio-stream-loader
   #:register-audio-stream-loader-f
   #:load-sample
   #:load-sample-f
   #:load-audio-stream
   #:load-audio-stream-f
   #:save-sample
   #:save-sample-f

;;; Audio codecs addon
   #:init-acodec-addon
   #:get-allegro-acodec-version

;;; Font addons
   ;; General font routines
   #:align-left
   #:align-centre
   #:align-center
   #:align-right
   #:align-integer

   #:init-font-addon
   #:shutdown-font-addon
   #:load-font
   #:destroy-font
   #:register-font-loader
   #:get-font-line-height
   #:get-font-ascent
   #:get-font-descent
   #:get-text-width
   #:get-ustr-width
   #:draw-text
   #:draw-ustr
   #:draw-justified-text
   #:draw-justified-ustr
   #:draw-textf
   #:draw-justified-text
   #:get-text-dimensions
   #:get-ustr-dimensions
   #:get-allegro-font-version

   ;; Bitmap fonts
   #:grab-font-from-bitmap
   #:load-bitmap-font
   #:create-builtin-font   

   ;; TTF fonts
   #:init-ttf-addon
   #:shutdown-ttf-addon
   #:load-ttf-font
   #:load-ttf-font-f
   #:load-ttf-font-stretch
   #:load-ttf-font-stretch-f
   #:get-allegro-ttf-version

;;; Image I/O addon
   #:init-image-addon
   #:shutdown-image-addon
   #:get-allegro-image-version

;;; Memfile addon
   #:open-memfile
   #:get-allegro-memfile-version

;;; Native dialogs support
   #:init-native-dialog-addon
   #:shutdown-native-dialog-addon
   #:create-native-file-dialog
   #:show-native-file-dialog
   #:get-native-file-dialog-count
   #:get-native-file-dialoh-path
   #:destroy-native-file-dialog
   #:show-native-message-box
   #:open-native-text-log
   #:close-native-text-log
   #:append-native-text-log
   #:get-native-text-log-event-source
   #:get-allegro-native-dialog-version

;;; PhysicsFS addon
   #:set-physfs-file-interface
   #:get-allegro-physfs-version

;;; Primitives addon
   ;; General
   #:get-allegro-primitives-version
   #:init-primitives-addon
   #:shutdown-primitives-addon

   ;; High level drawing routines
   #:draw-line
   #:draw-triangle
   #:draw-filled-triangle
   #:draw-rectangle
   #:draw-filled-rectangle
   #:draw-rounded-rectangle
   #:draw-filled-rounded-rectangle
   #:calculate-arc
   #:draw-pieslice
   #:draw-filled-pieslice
   #:draw-ellipse
   #:draw-filled-ellipse
   #:draw-circle
   #:draw-filled-circle
   #:draw-arc
   #:draw-elliptical-arc
   #:calculate-spline
   #:draw-spline
   #:calculate-ribbon
   #:draw-ribbon

   ;; Low level drawing routines
   #:draw-prim
   #:draw-indexed-prim
   #:create-vertex-decl
   #:destroy-vertex-decl
   #:draw-soft-triangle
   #:draw-soft-line
   ))
