(in-package #:game)

(defun initialize-allegro ()
  (al:init)
  (al:init-image-addon)
  (al:install-mouse)
  (al:install-keyboard)
  (al:init-font-addon)
  (al:init-ttf-addon))

(defun initialize-display ()
  (al:create-display 640 480)
  (al:clear-to-color 0 0 0 1)
  (al:flip-display))

(defun startup ()
  (initialize-allegro)
  (initialize-display))

(defun shutdown ()
  (al:uninstall-system))
