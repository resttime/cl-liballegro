;;;; test.lisp
;;; Creates a white background display window and waits 2 seconds before closing.
(ql:quickload "cl-liballegro")                 ; Load the system

(defvar display)                               ; Make a variable that holds the ALLEGRO_DISPLAY pointer
(defun main ()
  (al:init)                                    ; al_init();
  (al:set-new-display-flags '(:windowed :resizable :opengl)) ; al_set_new_display_flags(ALLEGRO_WINDOWED | ALLEGRO_RESIZABLE);
  (al:set-new-display-option :vsync 1 :require) ; al_set_new_display_option(ALLEGRO_VSYNC, 1, ALLEGRO_REQUIRE);
  (setf display (al:create-display 800 600))   ; display = al_create_display(800, 600);
  (al:clear-to-color (al:map-rgb 128 128 128)) ; al_clear_to_color(...); //
  (al:flip-display)                            ; al_flip_display();
  (al:rest-time 2)                             ; al_rest(2);
  (al:destroy-display display)                 ; al_destroy_display(display);
  (al:uninstall-system))                       ; al_uninstall_system();
