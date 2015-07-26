(in-package #:cl-liballegro)

;;; Timer
(defcfun ("al_create_timer" create-timer) :pointer (speed-secs c-double))
(defcfun ("al_start_timer" start-timer) :void (timer :pointer))
(defcfun ("al_stop_timer" stop-timer) :void (timer :pointer))
(defcfun ("al_get_timer_started" get-timer-started) :boolean (timer :pointer))
(defcfun ("al_destroy_timer" destroy-timer) :void (timer :pointer))
(defcfun ("al_get_timer_count" get-timer-count) :int64 (timer :pointer))
(defcfun ("al_set_timer_count" set-timer-count) :void
  (timer :pointer) (new-count :int64))
(defcfun ("al_add_timer_count" add-timer-count) :void
  (timer :pointer) (diff :int64))
(defcfun ("al_get_timer_speed" get-timer-speed) c-double (timer :pointer))
(defcfun ("al_set_timer_speed" set-timer-speed) :void
  (timer :pointer) (new-speed-secs c-double))
(defcfun ("al_get_timer_event_source" get-timer-event-source) :pointer
  (timer :pointer))
