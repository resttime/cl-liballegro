(in-package #:cl-liballegro)

(defcfun ("al_init_video_addon" init-video-addon) :bool)
(defcfun ("al_is_video_addon_initialized" is-init-video-addon-initialized) :bool)
(defcfun ("al_shutdown_video_addon" shutdown-video-addon) :void)
(defcfun ("al_get_allegro_video_version" get-allegro-video-version) :uint32)
(defcfun ("al_open_video" open-video) :pointer (filename :string))
(defcfun ("al_close_video" close-video) :void (video :pointer))
(defcfun ("al_start_video" start-video) :void (video :pointer) (mixer :pointer))
(defcfun ("al_start_video_with_voice" start-video-with-voice) :void
  (video :pointer) (voice :pointer) )
(defcfun ("al_get_video_event_source" get-video-event-source) :pointer
  (video :pointer))
(defcfun ("al_set_video_playing" set-video-playing) :void
  (video :pointer) (play :bool))
(defcfun ("al_is_video_playing" is-video-playing) :bool (video :pointer))
(defcfun ("al_get_video_audio_rate" get-video-audio-rate) :double
  (video :pointer))
(defcfun ("al_get_video_fps" get-video-fps) :double (video :pointer))
(defcfun ("al_get_video_scaled_width" get-video-scaled-width) :float
  (video :pointer))
(defcfun ("al_get_video_scaled_height" get-video-scaled-height) :float
  (video :pointer))
(defcfun ("al_get_video_frame" get-video-frame) :pointer (video :pointer))
(defcfun ("al_get_video_position" get-video-position) :double
  (video :pointer) (which video-position-type))
(defcfun ("al_seek_video" set-seek-video) :bool
  (video :pointer) (pos-in-seconds :double))
