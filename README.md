![alt logo](http://alleg.sourceforge.net/images/logo.png)

[![Quicklisp](http://quickdocs.org/badge/cl-liballegro.svg)](http://quickdocs.org/cl-liballegro/)
Description
--------------

Interface and bindings to the [Allegro 5 game programming library](http://alleg.sourceforge.net/)

I hope for it to be as clean and neat as cl-opengl.

Check out how the [bindings' source code](https://github.com/resttime/cl-liballegro/tree/master/src) is organized and compare it to the
[API reference](http://alleg.sourceforge.net/a5docs/5.2.0/).

Requires
------------------
libffi

Usage
--------------
1. `al_*` becomes `al:*`
2. `(al:rest secs)` is `(al:rest-time secs)` because of symbol interference with #'cl:rest.
3. Enums/constants are shortened, check [constants.lisp](https://github.com/resttime/cl-liballegro/tree/master/src/constants.lisp) if you need help finding them.
4. Type names have changed too, check [types.lisp](https://github.com/resttime/cl-liballegro/tree/master/src/types.lisp) if you need help finding them.
5. Also check [type-accessors.lisp](https://github.com/resttime/cl-liballegro/tree/master/src/type-accessors.lisp) on how to get to the slot values.
6. I've got a neat lispy interface [here](https://github.com/resttime/cl-liballegro/tree/master/src/interface/interface.lisp)
7. Everything else is pretty much 1-to-1
8. Examples exist if you get lost

***Feel free to raise an issue to request a feature or for me to work on something***

Functionality
--------------
Complete but missing haptic, shader, and the video streaming addon.

**I won't work on the following sections because Common Lisp has more suitable implementations.
(Might eventually do it for completeness though)
Feel free to explain otherwise and I'll listen.**

* Filesystem
* Memory
* Threads
* UTF-8

FAQ
--------------
**Why can't my program find the DLL in Windows?**

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
