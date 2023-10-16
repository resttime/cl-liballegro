(ql:quickload :cl-liballegro)

(defun display-msg-box ()
  "View the function definition for more details:
https://liballeg.github.io/a5docs/trunk/native_dialog.html#al_show_native_message_box

Flags are defined in src/constants/addons/native-dialogs.lisp"
  (al:init)
  (al:init-native-dialog-addon)
  (let ((display (al:create-display 800 600)))
    (al:show-native-message-box display "Title" "Heading" "Text" (cffi:null-pointer) 0)
    (al:destroy-display display))
  (al:shutdown-native-dialog-addon)
  (al:uninstall-system))
