(in-package #:cl-liballegro)

(defcfun ("al_create_thread" create-thread) (:pointer (:struct thread))
  (proc :pointer) (arg :pointer))
(defcfun ("al_create_thread_with_stacksize" create-thread-with-stacksize) (:pointer (:struct thread))
  (proc :pointer) (arg :pointer) (stacksize :uint))
(defcfun ("al_start_thread" start-thread) :void
  (thread :pointer (:struct thread)))
(defcfun ("al_join_thread" join-thread) :void
  (thread (:pointer (:struct thread))) (ret-value :pointer))
(defcfun ("al_set_thread_should_stop" set-thread-should-stop) :void
  (thread (:pointer (:struct thread))))
(defcfun ("al_get_thread_should_stop" get-thread-should-stop) :bool
  (thread (:pointer (:struct thread))))
(defcfun ("al_destroy_thread" destroy-thread) :void
  (thread (:pointer (:struct thread))))
(defcfun ("al_run_detached_thread" run-detached-thread) :void
  (proc :pointer) (arg :pointer))
(defcfun ("al_create_mutex" create-mutex) (:pointer (:struct mutex)))
(defcfun ("al_create_mutex_recursive" create-mutex-recursive) (:pointer (:struct mutex)))
(defcfun ("al_lock_mutex" lock-mutex) :void
  (mutex (:pointer (:struct mutex))))
(defcfun ("al_unlock_mutex" unlock-mutex) :void
  (mutex (:pointer (:struct mutex))))
(defcfun ("al_destroy_mutex" destroy-mutex) :void
  (mutex (:pointer (:struct mutex))))
(defcfun ("al_create_cond" create-cond) (:pointer (:struct thread-condition)))
(defcfun ("al_destroy_cond" destroy-cond) :void
  (cond (:pointer (:struct thread-condition))))
(defcfun ("al_wait_cond" wait-cond) :void
  (cond (:pointer (:struct thread-condition))) (mutex (:pointer (:struct mutex))))
(defcfun ("al_wait_cond_until" wait-cond-until) :int
  (cond (:pointer (:struct thread-condition))) (mutex (:pointer (:struct mutex)))
  (timeout (:pointer (:struct timeout))))
(defcfun ("al_broadcast_cond" broadcast-cond) :void
  (cond (:pointer (:struct thread-condition))))
(defcfun ("al_signal_cond" signal-cond) :void
  (cond (:pointer (:struct thread-condition))))
