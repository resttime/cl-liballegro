(in-package #:cl-liballegro)

;;; Events
(defcfun ("al_create_event_queue" create-event-queue) :pointer)
(defcfun ("al_destroy_event_queue" destroy-event-queue) :void (queue :pointer))
(defcfun ("al_register_event_source" register-event-source) :void
  (queue :pointer) (source :pointer))
(defcfun ("al_unregister_event_source" unregister-event-source) :void
  (queue :pointer) (source :pointer))
(defcfun ("al_is_event_queue_empty" is-event-queue-empty) :boolean (queue :pointer))
(defcfun ("al_get_next_event" get-next-event) :boolean
  (queue :pointer) (ret-event :pointer))
(defcfun ("al_peek_next_event" peek-next-event) :boolean
  (queue :pointer) (ret-event :pointer))
(defcfun ("al_drop_next_event" drop-next-event) :boolean (queue :pointer))
(defcfun ("al_flush_event_queue" flush-event-queue) :void (queue :pointer))
(defcfun ("al_wait_for_event" wait-for-event) :void
  (queue :pointer) (ret-event :pointer))
(defcfun ("al_wait_for_event_timed" wait-for-event-timed) :boolean
  (queue :pointer) (ret-event :pointer) (secs c-float))
(defcfun ("al_wait_for_event_until" wait-for-event-until) :boolean
  (queue :pointer) (ret-event :pointer) (timeout :pointer))
(defcfun ("al_init_user_event_source" init-user-event-source) :void (src :pointer))
(defcfun ("al_destroy_user_event_source" destroy-user-event-source) :void
  (src :pointer))
(defcfun ("al_emit_user_event" emit-user-event) :boolean
  (src :pointer) (event :pointer) (dtor :pointer))
(defcfun ("al_unref_user_event" unref-user-event) :void (event :pointer))
(defcfun ("al_get_event_source_data" get-event-source-data) :pointer
  (source :pointer))
(defcfun ("al_set_event_source_data" set-event-source-data) :void
  (source :pointer) (data :pointer))
