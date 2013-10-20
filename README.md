#allegro_color is now supported

Description
--------------

This is going to be a formal CFFI of the Allegro 5 programming library
that will be organized by sections of the API reference manual:
http://alleg.sourceforge.net/a5docs/5.0.10/

I hope for it to be as clean and neat as cl-opengl.


Usages
--------------
1. `al_*` becomes `al:*`
2. `(al:rest secs)` is `(al:rest-time secs)` because of symbol interference with (rest list).
3. `allegro_*` is removed in many places
4. Many enums are shortened check [constants.lisp](cl-liballegro/allegro/constants.lisp) if you need help finding them
 
***Feel free to raise an issue to request a feature or for me to work on something***

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

**I won't work on the following sections because I am under the impression
that Common Lisp has more suitable implementations or it just is not practical. 
Feel free to explain otherwise and I'll listen.**

* File I/O 
* Filesystem 
* Memory 
* Threads 
* UTF-8
* Main addon 
