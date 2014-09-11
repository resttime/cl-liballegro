(in-package #:cl-liballegro)

;;; Platform-specific
;; Windows
(defcfun ("al_get_win_window_handle" get-win-window-handle) :pointer (display :pointer))
;; Mac OS X
(defcfun ("al_osx_get_window" osx-get-window) :pointer (display :pointer))
;; iPhone
(defcfun ("al_iphone_program_has_halted" iphone-program-has-halted) :void)
(defcfun ("al_iphone_override_screen_scale" iphone-override-screen-scale) :void
  (scale c-float))
