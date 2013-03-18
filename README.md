cl-liballegro
==========
***It's usable!***
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
1. `al_*` becomes `al:*`
2. Do not pass ALLEGRO_COLOR to functions, use four numbers instead. (CFFI cannot pass structures by value, only pointers)
3. `(al:rest secs)` is `(al:rest-time secs)` instead because of symbol interference with (rest list).

```cl
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
```

FAQ
--------------
1. **How do I `(ql:quickload "cl-liballegro")` from any location?**
 * Either add the path to your asdf by putting this line to your ~/.sbclrc file *(remember to change '\' -> '/')*: 
```
(push #p"/path/to/cl-liballegro/" asdf:*central-registry*)
```
 * Or copy cl-liballegro to /path/to/quicklisp/local-projects/cl-liballegro
 
2. **Why can't my program find the DLL?**

 There are path problems in Windows because the DLL files (which contain all the functions the CFFI calls upon) 
 doesn't have a default location unlike in Unix environments. When the library loads in Windows, ***it will look for 
 the DLL in the current folder of the FILE.LISP that evaluates `(ql:quickload "cl-liballegro")`*** This means you must 
 have a copy of the DLL file in the directory of FILE.LISP, not in the cl-liballegro directory unless the FILE.LISP is 
 in there. SLIME however, likes to change the default search folder to the one Emacs is in when it starts.

 **SBCL Only** - `Open command prompt in the folder that contains both the DLL and game.lisp`
```
> sbcl
> (load "game.lisp")                      ; File contains (ql:quickload "cl-liballegro")
```

 **Emacs + SLIME**
```
C-x C-f /path/to/Desktop/file9.lisp
M-x slime
C-x C-f /path/to/Desktop/game/game.lisp ; File contains (ql:quickload "cl-liballegro")
C-c C-l                                 ; Looks for the DLL at /path/to/Desktop/allegro.dll
```
```
C-x C-f /path/to/Desktop/file9.lisp
C-x C-f /path/to/Desktop/game/game.lisp ; File contains (ql:quickload "cl-liballegro")
M-x slime
C-c C-l                                 ; Looks for the DLL at /path/to/Desktop/game/allegro.dll
```
```
M-x slime
C-x C-f /path/to/Desktop/game/game.lisp ; File contains (ql:quickload "cl-liballegro")
C-c C-l                                 ; Looks for the DLL at /whatever/default/emacs/directory/allegro.dll
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
