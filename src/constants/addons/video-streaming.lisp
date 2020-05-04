(in-package :cl-liballegro)

(defcenum video-event-type
  (:frame-show 550)
  (:finished 551)
  (:-seek 552))

(defcenum video-position-type
  :actual
  :video-decode
  :audio-decode)
