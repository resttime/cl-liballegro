cl-liballegro
==========

`(require "cl-liballegro") ; ASDF system working`

Description
--------------

This is going to be a formal CFFI of the Allegro 5 programming library
that will be organized by sections of the API reference manual. This will take a while to complete...
http://alleg.sourceforge.net/a5docs/5.0.9/

I hope for it to be as clean and neat as cl-opengl.

After writing the bindings, I'll work on separating it from CFFI.
Then I'll write helper macros/functions for neat integration with Lisp. 
Both of which will worked on while I create a game.



Usages
--------------
- `al_*` becomes `al:*`
- Do not pass ALLEGRO_COLOR to functions, use four numbers instead. (CFFI cannot pass structures by value, only pointers)
- `(al:rest secs)` is `(al:rest-time secs)` instead because of symbol interference with (rest list).

Example:
```cl
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
```
  
Progress
--------------
***I am using unverified, estimated percentages***

**[???%] means I will not work on the section for the foreseeable future because I am under the impression
that Common Lisp has more suitable implementations already or it just is not practical.**

Configuration Files **[95%]**
Display **[80%]?**
Events - **[85%]**
File I/O - **[???%]**
Filesystem - **[???%]**
Fixed point math - **[95%]**
Fullscreen modes - **[95%]**
Graphics - **[85%]**
Joystick - **[90%]**
Keyboard - **[90%]**
Memory - **[???%]**
Mouse - **[95%]**
Path - **[95%]**
State - **[95%]**
System - **[95%]**
Threads - **[???%]**
Time - **[95%]**
Timer - **[95%]**
Transformations - **[95%]**
UTF-8 - **[???%]**
Miscellaneous - **[99%]**
Platform-specific - **[???%]**
Direct3D - **[???%]**
OpenGL - **[95%]**

Audio addon - **[95%]**
Audio codecs - **[99%]**
Color addon - **[???%]**
Font addons - **[95%]**
Image I/O addon - **[95%]**
Main addon - **[???%]**
Memfile addon - **[95%]**
Native dialogs addon - **[95%]**
PhysicsFS addon - **[95%]**
Primitives addon - **[90%]**
