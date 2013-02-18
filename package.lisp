(defpackage #:cl-liballegro
  (:use #:cl #:cffi)
  (:nicknames #:al #:liballegro :alleg)
  (:export
   
   ;; Configuration Files
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
   #:+allegro-event-joystick-axis+
   #:+allegro-event-joystick-button-down+
   #:+allegro-event-joystick-button-up+
   #:+allegro-event-joystick-configuration+
   #:+allegro-event-key-down+
   #:+allegro-event-key-char+
   #:+allegro-event-key-up+
   #:+allegro-event-mouse-axes+
   #:+allegro-event-mouse-button-down+
   #:+allegro-event-mouse-button-up+
   #:+allegro-event-mouse-enter-display+
   #:+allegro-event-mouse-leave-display+
   #:+allegro-event-mouse-warped+
   #:+allegro-event-timer+
   #:+allegro-event-display-expose+
   #:+allegro-event-display-resize+
   #:+allegro-event-display-close+
   #:+allegro-event-display-lost+
   #:+allegro-event-display-found+
   #:+allegro-event-display-switch-in+
   #:+allegro-event-display-switch-out+
   #:+allegro-event-display-orientation+

   #:allegro-any-event
   #:allegro-display-event
   #:allegro-joystick-event
   #:allegro-keyboard-event
   #:allegro-mouse-event
   #:allegro-timer-event
   #:allegro-user-event
   #:allegro-event

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

   ;;; Fullscreen modes
   #:get-display-mode
   #:get-num-display-modes
   
   ;;; Graphics
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
   #:+allegro-key-a+
   #:+allegro-key-b+
   #:+allegro-key-c+
   #:+allegro-key-d+
   #:+allegro-key-e+
   #:+allegro-key-f+
   #:+allegro-key-g+
   #:+allegro-key-h+
   #:+allegro-key-i+
   #:+allegro-key-j+
   #:+allegro-key-k+
   #:+allegro-key-l+
   #:+allegro-key-m+
   #:+allegro-key-n+
   #:+allegro-key-o+
   #:+allegro-key-p+
   #:+allegro-key-q+
   #:+allegro-key-r+
   #:+allegro-key-s+
   #:+allegro-key-t+
   #:+allegro-key-u+
   #:+allegro-key-v+
   #:+allegro-key-w+
   #:+allegro-key-x+
   #:+allegro-key-y+
   #:+allegro-key-z+

   #:+allegro-key-0+
   #:+allegro-key-1+
   #:+allegro-key-2+
   #:+allegro-key-3+
   #:+allegro-key-4+
   #:+allegro-key-5+
   #:+allegro-key-6+
   #:+allegro-key-7+
   #:+allegro-key-8+
   #:+allegro-key-9+

   #:+allegro-key-pad-0+
   #:+allegro-key-pad-1+
   #:+allegro-key-pad-2+
   #:+allegro-key-pad-3+
   #:+allegro-key-pad-4+
   #:+allegro-key-pad-5+
   #:+allegro-key-pad-6+
   #:+allegro-key-pad-7+
   #:+allegro-key-pad-8+
   #:+allegro-key-pad-9+

   #:+allegro-key-f1+
   #:+allegro-key-f2+
   #:+allegro-key-f3+
   #:+allegro-key-f4+
   #:+allegro-key-f5+
   #:+allegro-key-f6+
   #:+allegro-key-f7+
   #:+allegro-key-f8+
   #:+allegro-key-f9+
   #:+allegro-key-f10+
   #:+allegro-key-f11+
   #:+allegro-key-f12+

   #:+allegro-key-escape+
   #:+allegro-key-tilde+
   #:+allegro-key-minus+
   #:+allegro-key-equals+
   #:+allegro-key-backspace+
   #:+allegro-key-tab+
   #:+allegro-key-openbrace+
   #:+allegro-key-closebrace+
   #:+allegro-key-enter+
   #:+allegro-key-semicolon+
   #:+allegro-key-quote+
   #:+allegro-key-backslash+
   #:+allegro-key-backslash2+
   #:+allegro-key-comma+
   #:+allegro-key-fullstop+
   #:+allegro-key-slash+
   #:+allegro-key-space+

   #:+allegro-key-insert+
   #:+allegro-key-delete+
   #:+allegro-key-home+
   #:+allegro-key-end+
   #:+allegro-key-pgup+
   #:+allegro-key-pgdn+
   #:+allegro-key-left+
   #:+allegro-key-right+
   #:+allegro-key-up+
   #:+allegro-key-down+

   #:+allegro-key-pad-slash+
   #:+allegro-key-pad-asterisk+
   #:+allegro-key-pad-minus+
   #:+allegro-key-pad-plus+
   #:+allegro-key-pad-delete+
   #:+allegro-key-pad-enter+

   #:+allegro-key-printscreen+
   #:+allegro-key-pause+
   
   #:+allegro-key-modifiers
   #:+allegro-key-lshift+
   #:+allegro-key-rshift+
   #:+allegro-key-lctrl+
   #:+allegro-key-rctrl+
   #:+allegro-key-alt+
   #:+allegro-key-altgr+
   #:+allegro-key-lwin+
   #:+allegro-key-rwin+
   #:+allegro-key-menu+
   #:+allegro-key-scrolllock+
   #:+allegro-key-numlock+
   #:+allegro-key-capslock+
   
   ;;Keyboard modifier flags
   #:+allegro-keymod-shift+
   #:+allegro-keymod-ctrl+
   #:+allegro-keymod-alt+
   #:+allegro-keymod-lwin+
   #:+allegro-keymod-rwin+
   #:+allegro-keymod-menu+
   #:+allegro-keymod-altgr+
   #:+allegro-keymod-command+
   #:+allegro-keymod-scrolllock+
   #:+allegro-keymod-numlock+
   #:+allegro-keymod-capslock+
   
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
   #:+allegro-pi+

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
   #:get-sample-nstance-depth
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
   #:get-sample-instnace-playmode
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
   #:destroy-audio-steram
   #:get-audio-stream-event-source
   #:drain-audio-stream
   #:rewind-audio-stream
   #:get-audio-stream-frequency
   #:get-audio-stream-channels
   #:get-audio-stram-depth
   #:get-audio-stream-length
   #:get-audio-stream-speed
   #:set-audio-strema-speed
   #:get-audio-stream-gain
   #:set-audio-stream-gain
   #:get-audio-stream-pan
   #:set-audio-stream-pan
   #:get-audio-stram-playing
   #:set-audio-stram-playing
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
   #:+allegro-align-left+
   #:+allegro-align-centre+
   #:+allegro-align-center+
   #:+allegro-align-right+
   #:+allegro-align-integer+

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
  ))
