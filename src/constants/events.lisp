(in-package :cl-liballegro)

(defcenum event-types
  (:joystick-axis 1)
  (:joystick-button-down 2)
  (:joystick-button-up 3)
  (:joystick-configuration 4)

  (:key-down 10)
  (:key-char 11)
  (:key-up 12)

  (:mouse-axis 20)
  (:mouse-button-down 21)
  (:mouse-button-up 22)
  (:mouse-enter-display 23)
  (:mouse-leave-display 24)
  (:mouse-warped 25)

  (:timer 30)

  (:display-expose 40)
  (:display-resize 41)
  (:display-close 42)
  (:display-lost 43)
  (:display-found 44)
  (:display-switch-in 45)
  (:display-switch-out 46)
  (:display-orientation 47)
  (:display-halt-drawing 48)
  (:display-resume-drawing 49)

  (:touch-begin 50)
  (:touch-end 51)
  (:touch-move 52)
  (:touch-cancel 53)

  (:display-connected 60)
  (:display-disconnected 61)

  ;; Video event type (addon)
  (:video-frame-show 550)
  (:video-finished 551)
  (:-video-seek 552)
  )

