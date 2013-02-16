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
   
   ;; Display Operations
   #:flip-display
   #:get-backbuffer
   #:get-display-event-source
   
   ;; Fullscreen display mode
   #:get-display-mode
   #:get-num-display-modes

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

   ;;; Graphics
   ;; Bitmap Creation
   #:create-bitmap
   #:create-sub-bitmap
   #:clone-bitmap
   #:destroy-bitmap

   ;; Drawing Operations
   #:clear-to-color
   #:draw-bitmap
   #:draw-tinted-bitmap
   #:draw-rotated-bitmap

   ;; Images I/O
   #:load-bitmap
   #:load-bitmap-f

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

   ;;; System
   #:install-system
   #:init
   #:get-allegro-version
   #:uninstall-system
   #:is-system-installed

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

   ;;; Miscellaneous routines
   #:+allegro-pi+

   ;;; Audio addon
   ;; Setting up audio
   #:install-audio
   #:uninstall-audio
   #:is-audio-installed
   #:reserve-samples

   ;; Sample functions
   #:play-sample

   ;; Audio file I/O
   #:load-sample

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
   #:draw-text

   ;; TTF fonts
   #:init-ttf-addon
   #:shutdown-ttf-addon
   #:load-ttf-font
   #:load-ttf-font-f

   ;;; Image I/O addon
   #:init-image-addon
   #:shutdown-image-addon
   #:get-allegro-image-version
  ))