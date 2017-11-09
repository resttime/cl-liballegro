(in-package #:cl-liballegro)

;;; Platform-specific
;; Windows
#+windows
(progn
  (defcfun ("al_get_win_window_handle" get-win-window-handle) :pointer (display :pointer))
  (defcfun ("al_win_add_window_callback" win-add-window-callback) :boolean
    (display :pointer) (callback :pointer) (userdata :pointer))
  (defcfun ("al_win_remove_window_callback" win-remove-window-callback) :boolean
    (display :pointer) (callback :pointer) (userdata :pointer)))

;; Mac OS X
#+(or darwin macos macosx)
(defcfun ("al_osx_get_window" osx-get-window) :pointer (display :pointer))

;; iPhone
#+ios
(progn
  (defcfun ("al_iphone_program_has_halted" iphone-program-has-halted) :void)
  (defcfun ("al_iphone_override_screen_scale" iphone-override-screen-scale) :void
    (scale c-float)))

#+android
(progn
  (defcfun ("al_android_set_apk_file_interface" android-set-apk-file-interface) :void)
  (defcfun ("al_android_set_apk_file_fs_interface" android-set-apk-file-fs-interface) :void)
  (defcfun ("al_android_get_os_version" android-get-os-version) :string))

#+unix
(defcfun ("al_get_x_window_id" get-x-window-id) :ulong (display :pointer))
