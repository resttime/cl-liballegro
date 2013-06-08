;;;; test.lisp
;;; Creates a white background display window and waits 2 seconds before closing.
(ql:quickload "cl-liballegro")               ; Load the system

(defvar display)                             ; Make a variable that holds the ALLEGRO_DISPLAY pointer
(defun main ()
  (al:init)                                  ; al_init();
  (setf display (al:create-display 800 600)) ; display = al_create_display(800, 600);
  (al:clear-to-color 1 1.0 1.0 1.0)          ; al_clear_to_color(...); // Not using an ALLEGRO_COLOR structure
  (al:flip-display)                          ; al_flip_display();
  (al:rest-time 2)                           ; al_rest(2);
  (al:destroy-display display)               ; al_destroy_display(display);
  (al:uninstall-system))                     ; al_uninstall_system();
