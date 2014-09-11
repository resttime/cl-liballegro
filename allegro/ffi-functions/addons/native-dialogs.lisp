(in-package #:cl-liballegro)

;;; Native dialogs support
(defcfun ("al_init_native_dialog_addon" init-native-dialog-addon) :boolean)
(defcfun ("al_shutdown_native_dialog_addon" shutdown-native-dialog-addon) :void)
(defcfun ("al_create_native_file_dialog" create-native-file-dialog) :pointer
  (initial-path :string) (title :string) (patterns :string) (modes filechooser-modes))
(defcfun ("al_show_native_file_dialog" show-native-file-dialog) :boolean
  (display :pointer) (dialog :pointer))
(defcfun ("al_get_native_file_dialog_count" get-native-file-dialog-count) :int
  (dialog :pointer))
(defcfun ("al_get_native_file_dialog_path" get-native-file-dialog-path) :string
  (dialog :pointer) (i :uint))
(defcfun ("al_destroy_native_file_dialog" destroy-native-file-dialog) :void
  (dialog :pointer))
(defcfun ("al_show_native_message_box" show-native-message-box) :int
  (display :pointer) (title :string) (heading :string)
  (text :string) (buttons :string) (flags messagebox-flags))
(defcfun ("al_open_native_text_log" open-native-text-log) :pointer
  (title :string) (flags :int))
(defcfun ("al_close_native_text_log" close-native-text-log) :void
  (textlog :pointer))
(defcfun ("al_append_native_text_log" append-native-text-log) :void
  (textlog :pointer) (format :string))
(defcfun ("al_get_native_text_log_event_source" get-native-text-log-event-source)
    :pointer
  (textlog :pointer))
(defcfun ("al_get_allegro_native_dialog_version" get-allegro-native-dialog-version)
    :uint32)
