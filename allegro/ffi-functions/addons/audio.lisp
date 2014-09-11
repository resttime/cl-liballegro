(in-package #:cl-liballegro)

;;; Audio addon
;; Setting up audio
(defcfun ("al_install_audio" install-audio) :boolean)
(defcfun ("al_uninstall_audio" uninstall-audio) :void)
(defcfun ("al_is_audio_installed" is-audio-installed) :boolean)
(defcfun ("al_reserve_samples" reserve-samples) :boolean (reserve-samples :int))

;; Misc audio functions
(defcfun ("al_get_allegro_audio_version" get-allegro-audio-version) :uint32)
(defcfun ("al_get_audio_depth_size" get-audio-depth-size) :uint
  (depth audio-depth))
(defcfun ("al_get_channel_count" get-channel-count) :uint
  (conf channel-conf))

;; Voice functions
(defcfun ("al_create_voice" create-voice) :pointer
  (freq :uint) (depth audio-depth) (chan-conf channel-conf))
(defcfun ("al_destroy_voice" destory-voice) :void (voice :pointer))
(defcfun ("al_detach_voice" detach-voice) :void (voice :pointer))
(defcfun ("al_attach_audio_stream_to_voice" attach-audio-stream-to-voice) :boolean
    (stream :pointer) (voice :pointer))
(defcfun ("al_attach_mixer_to_voice" attach-mixer-to-voice) :boolean
  (mixer :pointer) (voice :pointer))
(defcfun ("al_attach_sample_instance_to_voice" attach-sample-instance-to-voice)
    :boolean
  (spl :pointer) (voice :pointer))
(defcfun ("al_get_voice_frequency" get-voice-frequency) :uint (voice :pointer))
(defcfun ("al_get_voice_channels" get-voice-channels) channel-conf
  (voice :pointer))
(defcfun ("al_get_voice_depth" get-voice-depth) audio-depth
  (voice :pointer))
(defcfun ("al_get_voice_playing" get-voice-playing) :boolean (voice :pointer))
(defcfun ("al_set_voice_playing" set-voice-playing) :boolean
  (voice :pointer) (val :boolean))
(defcfun ("al_get_voice_position" get-voice-position) :uint (voice :pointer))
(defcfun ("al_set_voice_position" set-voice-position) :boolean
  (voice :pointer) (val :int))

;; Sample functions
(defcfun ("al_create_sample" create-sample) :pointer
  (buf :pointer) (sample :uint) (freq :uint)
  (depth audio-depth) (chan-conf channel-conf)
  (free-buf :boolean))
(defcfun ("al_destroy_sample" destroy-sample) :void (spl :pointer))
(defcfun ("al_play_sample" play-sample) :boolean
  (spl :pointer)
  (gain c-float) (pan c-float) (speed c-float)
  (playmode playmode)
  (ret-id :pointer))
(defcfun ("al_stop_sample" stop-sample) :void (spl-id :pointer))
(defcfun ("al_stop_samples" stop-samples) :void)
(defcfun ("al_get_sample_channels" get-sample-channels) channel-conf
  (spl :pointer))
(defcfun ("al_get_sample_depth" get-sample-depth) audio-depth
  (spl :pointer))
(defcfun ("al_get_sample_frequency" get-sample-frequency) :uint (spl :pointer))
(defcfun ("al_get_sample_length" get-sample-length) :uint (spl :pointer))
(defcfun ("al_get_sample_data" get-sample-data) :void (spl :pointer))

;; Sample instance functions
(defcfun ("al_create_sample_instance" create-sample-instance) :pointer
  (sample-data :pointer))
(defcfun ("al_destroy_sample_instance" destroy-sample-instance) :void
  (sample-data :pointer))
(defcfun ("al_play_sample_instance" play-sample-instance) :boolean (spl :pointer))
(defcfun ("al_stop_sample_instance" stop-sample-instance) :boolean (spl :pointer))
(defcfun ("al_get_sample_instance_channels" get-sample-instance-channels)
    channel-conf
  (spl :pointer))
(defcfun ("al_get_sample_instance_depth" get-sample-instance-depth)
    audio-depth
  (spl :pointer))
(defcfun ("al_get_sample_instance_frequency" get-sample-instance-frequency) :uint
  (spt :pointer))
(defcfun ("al_get_sample_instance_length" get-sample-instance-length) :uint
  (spt :pointer))
(defcfun ("al_set_sample_instance_length" set-sample-instance-length) :boolean
  (spt :pointer) (val :uint))
(defcfun ("al_get_sample_instance_position" get-sample-instance-position) :uint
  (spl :pointer))
(defcfun ("al_set_sample_instance_position" set-sample-instance-position) :boolean
  (spl :pointer) (val :uint))
(defcfun ("al_get_sample_instance_speed" get-sample-instance-speed) c-float
  (spl :pointer))
(defcfun ("al_set_sample_instance_speed" set-sample-instance-speed) :boolean
  (spl :pointer) (val c-float))
(defcfun ("al_get_sample_instance_gain" get-sample-instance-gain) c-float
  (spl :pointer))
(defcfun ("al_set_sample_instance_gain" set-sample-instance-gain) :boolean
  (spl :pointer) (val c-float))
(defcfun ("al_get_sample_instance_pan" get-sample-instance-pan) c-float
  (spl :pointer))
(defcfun ("al_set_sample_instance_pan" set-sample-instance-pan) :boolean
  (spl :pointer) (val c-float))
(defcfun ("al_get_sample_instance_time" get-sample-instance-time) c-float
  (spl :pointer))
(defcfun ("al_get_sample_instance_playmode" get-sample-instance-playmode)
    playmode
  (spl :pointer))
(defcfun ("al_set_sample_instance_playmode" set-sample-instance-playmode) :boolean
  (spl :pointer) (val playmode))
(defcfun ("al_get_sample_instance_playing" get-sample-instance-playing) :boolean
  (spl :pointer))
(defcfun ("al_set_sample_instance_playing" set-sample-instance-playing) :boolean
  (spl :pointer) (val :boolean))
(defcfun ("al_get_sample_instance_attached" get-sample-instance-attached) :boolean
  (spl :pointer))
(defcfun ("al_detach_sample_instance" detach-sample-instance) :boolean
  (spl :pointer))
(defcfun ("al_get_sample" get-sample) :pointer (spl :pointer))
(defcfun ("al_set_sample" set-sample) :boolean (spl :pointer) (data :pointer))

;; Mixer functions
(defcfun ("al_create_mixer" create-mixer) :pointer
  (freq :uint) (depth audio-depth) (chan-conf channel-conf))
(defcfun ("al_destroy_mixer" destroy-mixer) :void (mixer :pointer))
(defcfun ("al_get_default_mixer" get-default-mixer) :pointer)
(defcfun ("al_set_default_mixer" set-default-mixer) :boolean (mixer :pointer))
(defcfun ("al_restore_default_mixer" restore-default-mixer) :boolean)
(defcfun ("al_attach_mixer_to_mixer" attach-mixer-to-mixer) :boolean
  (stream :pointer) (mixer :pointer))
(defcfun ("al_attach_sample_instance_to_mixer" attach-sample-instance-to-mixer)
    :boolean
  (spl :pointer) (mixer :pointer))
(defcfun ("al_attach_audio_stream_to_mixer" attach-audio-stream-to-mixer) :boolean
  (stream :pointer) (mixer :pointer))
(defcfun ("al_get_mixer_frequency" get-mixer-frequency) :uint (mixer :pointer))
(defcfun ("al_set_mixer_frequency" set-mixer-frequency) :boolean
  (mixer :pointer) (val :uint))
(defcfun ("al_get_mixer_channels" get-mixer-channels) channel-conf
  (mixer :pointer))
(defcfun ("al_get_mixer_depth" get-mixer-depth) audio-depth
  (mixer :pointer))
(defcfun ("al_get_mixer_gain" get-mixer-gain) c-float
  (mixer :pointer))
(defcfun ("al_set_mixer_gain" set-mixer-gain) :boolean
  (mixer :pointer) (new-gain c-float))
(defcfun ("al_get_mixer_quality" get-mixer-quality) mixer-quality
  (mixer :pointer))
(defcfun ("al_set_mixer_quality" set-mixer-quality) :boolean
  (mixer :pointer) (new-quality mixer-quality))
(defcfun ("al_get_mixer_playing" get-mixer-playing) :boolean
  (mixer :pointer))
(defcfun ("al_set_mixer_playing" set-mixer-playing) :boolean
  (mixer :pointer) (val :boolean))
(defcfun ("al_get_mixer_attached" get-mixer-attached) :boolean (mixer :pointer))
(defcfun ("al_detach_mixer" detach-mixer) :boolean (mixer :pointer))
(defcfun ("al_set_mixer_postprocess_callback" set-mixer-postprocess-callback)
    :boolean
  (mixer :pointer) (pp-callback :pointer) (pp-callback-userdata :pointer))

;; Stream functions
(defcfun ("al_create_audio_stream" create-audio-stream) :pointer
  (fragment-count :uint) (frag-samples :uint) (freq :uint)
  (depth audio-depth) (chan-conf channel-conf))
(defcfun ("al_destroy_audio_stream" destroy-audio-stream) :void (stream :pointer))
(defcfun ("al_get_audio_stream_event_source" get-sudio-stream-event-source)
    :pointer
  (stream :pointer))
(defcfun ("al_drain_audio_stream" drain-audio-stream) :void (stream :pointer))
(defcfun ("al_rewind_audio_stream" rewind-audio-stream) :boolean (stream :pointer))
(defcfun ("al_get_audio_stream_frequency" get-audio-stream-frequency) :uint
  (stream :pointer))
(defcfun ("al_get_audio_stream_channels" get-audio-stream-channels)
    channel-conf
  (stream :pointer))
(defcfun ("al_get_audio_stream_depth" get-audio-stream-depth) audio-depth
  (stream :pointer))
(defcfun ("al_get_audio_stream_length" get-audio-stream-length) :uint
  (stream :pointer))
(defcfun ("al_get_audio_stream_speed" get-audio-stream-speed) c-float
  (stream :pointer))
(defcfun ("al_set_audio_stream_speed" set-audio-stream-speed) :boolean
  (stream :pointer) (val c-float))
(defcfun ("al_get_audio_stream_gain" get-audio-stream-gain) c-float
  (stream :pointer))
(defcfun ("al_set_audio_stream_gain" set-audio-stream-gain) :boolean
  (stream :pointer) (val c-float))
(defcfun ("al_get_audio_stream_pan" get-audio-stream-pan) c-float
  (stream :pointer))
(defcfun ("al_set_audio_stream_pan" set-audio-stream-pan) :boolean
  (stream :pointer) (val c-float))
(defcfun ("al_get_audio_stream_playing" get-audio-stream-playing) :boolean
  (stream :pointer))
(defcfun ("al_set_audio_stream_playing" set-audio-stream-playing) :boolean
  (stream :pointer) (val c-float))
(defcfun ("al_get_audio_stream_playmode" get-audio-stream-playmode) playmode
  (stream :pointer))
(defcfun ("al_set_audio_stream_playmode" set-audio-stream-playmode) :boolean
  (stream :pointer) (val playmode))
(defcfun ("al_get_audio_stream_attached" get-audio-stream-attached) :boolean
  (stream :pointer))
(defcfun ("al_detach_audio_stream" detach-audio-stream) :boolean
  (stream :pointer))
(defcfun ("al_get_audio_stream_fragment" get-audio-stream-fragment) :pointer
  (stream :pointer))
(defcfun ("al_set_audio_stream_fragment" set-audio-stream-fragment) :boolean
  (stream :pointer) (val :pointer))
(defcfun ("al_get_audio_stream_fragments" get-audio-stream-fragments) :uint
  (stream :pointer))
(defcfun ("al_get_available_audio_stream_fragments"
	  get-available-audio-stream-fragments) :uint
  (stream :pointer))
(defcfun ("al_seek_audio_stream_secs" seek-audio-stream-secs) :boolean
  (stream :pointer) (time c-double))
(defcfun ("al_get_audio_stream_position_secs"
	  get-audio-stream-position-secs) c-double
  (stream :pointer))
(defcfun ("al_get_audio_stream_length_secs" get-audio-stream-length-secs) c-double
  (stream :pointer))
(defcfun ("al_set_audio_stream_loop_secs" set-audio-stream-loop-secs) :boolean
  (stream :pointer) (start c-double) (end c-double))

;; Audio file I/O
(defcfun ("al_register_sample_loader" register-sample-loader) :boolean
  (ext :string) (loader :pointer))
(defcfun ("al_register_sample_loader_f" register-sample-loader-f) :boolean
  (ext :string) (loader :pointer))
(defcfun ("al_register_sample_saver" register-sample-saver) :boolean
  (ext :string) (saver :boolean))
(defcfun ("al_register_sample_saver_f" register-sample-saver-f) :boolean
  (ext :string) (saver :boolean))
(defcfun ("al_register_audio_stream_loader" register-audio-stream-loader) :boolean
  (ext :string) (stream-loader :pointer))
(defcfun ("al_register_audio_stream_loader_f" register-audio-stream-loader-f)
    :boolean
  (ext :string) (stream-loader :pointer))
(defcfun ("al_load_sample" load-sample) :pointer (filename :string))
(defcfun ("al_load_sample_f" load-sample-f) :pointer (fp :pointer) (ident :string))
(defcfun ("al_load_audio_stream" load-audio-stream) :pointer
  (filename :string) (buffer-count :int) (sample :uint))
(defcfun ("al_load_audio_stream_f" load-audio-stream-f) :pointer
  (fp :pointer) (ident :string) (buffer-count :int) (sample :uint))
(defcfun ("al_save_sample" save-sample) :boolean
  (filename :string) (spl :pointer))
(defcfun ("al_save_sample_f" save-sample-f) :boolean
  (fp :pointer) (ident :string) (spl :pointer))
