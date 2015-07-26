(in-package #:cl-liballegro)

;;; Monitor
(defcfun ("al_get_new_display_adapter" get-new-display-adapter) :int)
(defcfun ("al_set_new_display_adapter" set-new-display-adapter) :void (adapter :int))
(defcfun ("al_get_monitor_info" get-monitor-info) :boolean
  (adapter :int) (info :pointer))
(defcfun ("al_get_num_video_adapters" get-num-video-adapters) :int)
