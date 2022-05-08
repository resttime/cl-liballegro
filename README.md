- [Requires](#org8678f5e)
- [Quickstart](#org13326b9)
- [Projects](#org75312ec)
  - [GUI / UI](#org01babb4)
  - [Games](#orgdbed98a)
  - [Engine](#org9be2400)
- [General](#org8d5609f)
  - [CFFI](#org3bdcdbc)
  - [Orphaned Windows / Cleaning up Windows](#org8f15ba9)
  - [Optional Lisp Interface](#org925e03c)
  - [Mac OS X - Main UI Thread](#org9166168)
  - [Ignoring Floating Point Calculation Errors / Traps](#orga44d3cd)
  - [Windows - Library Paths](#org85d0467)
    - [With SBCL](#org55245c9)
    - [With Emacs + SLIME](#orgede031d)
- [Contributing / Developing / Hacking](#org4751a24)
  - [Project Structure](#orgbc757b5)
  - [Checklist](#org6aef0c5)
- [[CHANGELOG](./CHANGELOG.md)](#orgf411852)
- [Support / Help / Bug Reports](#orgd76da2d)
- [License](#org475a91d)

![img](http://liballeg.org/images/logo.png)

Interface and complete bindings to the [Allegro 5 game programming library](https://liballeg.org/).

Check out how the [source code](./src) is organized and compare it to the [API reference](https://liballeg.org/a5docs/trunk/).


<a id="org8678f5e"></a>

# Requires

[libffi](https://sourceware.org/libffi/)


<a id="org13326b9"></a>

# Quickstart

1.  `al_*` becomes `al:*`
2.  [Constants](./src/constants/) and [types](./src/types) are shortened too, check the source code if you need help finding them
3.  `(al:rest secs)` is `(al:rest-time secs)` because of symbol clash with `#'cl:rest`
4.  To access slots from a C struct, you can use `CFFI:MEM-REF` generate a plist
    
    ```lisp
    (defcstruct display-mode
      (width :int)
      (height :int)
      (format :int)
      (refresh-rate :int))
    
    (with-foreign-object (test '(:struct display-mode))
      (let ((plist (mem-ref test '(:struct display-mode))))
        (print plist)
        (print (getf plist 'width))))
    ```
5.  I've got a neat **OPTIONAL** [lispy interface](./src/interface/interface.lisp) which provides an entire fixed timestep game loop
6.  Everything else is pretty much 1-to-1
7.  If you're getting crashes on Mac OS X, put all your code into [callback](https://common-lisp.net/project/cffi/manual/html_node/defcallback.html) and pass it to [al:run-main](https://www.allegro.cc/manual/5/al_run_main)
8.  [Examples](./examples) exist if you get lost


<a id="org75312ec"></a>

# Projects

Various projects I've found using cl-liballegro. Feel free to add items onto the list!


<a id="org01babb4"></a>

## GUI / UI

-   [cl-liballegro-nuklear](https://github.com/lockie/cl-liballegro-nuklear) - Bindings to the [nuklear](https://github.com/Immediate-Mode-UI/Nuklear) immediate mode GUI library


<a id="orgdbed98a"></a>

## Games

-   [Darkness Looming: The Dawn](https://awkravchuk.itch.io/darkness-looming-the-dawn) - Old school hack n' slash
-   [simple-asteroids](https://github.com/xFA25E/simple-asteroids) - Simple asteroids
-   [tanks](https://github.com/VyacheslavMik/tanks) - Tanks


<a id="org9be2400"></a>

## Engine

-   [d2clone-kit](https://github.com/lockie/d2clone-kit) - Diablo 2 game engine


<a id="org8d5609f"></a>

# General

![img](https://user-images.githubusercontent.com/2598904/96662425-f3c4cf00-1313-11eb-9e59-807e27697c20.png)

The most basic usage is 1-to-1 just uses the bindings "as is" such as in this [example](./examples/001-simple-window.lisp).

Names have been changed to use a more lispy convention in which `_` is converted to `-`. In most cases function names match like `al_flip_display(display);` becomes `(al:flip-display display)`

However types, constants, and structures have been shortened for user convenience. There's no exact rules for it, but usually any prefix with `ALLEGRO_*` or `al_*` is truncated because Common Lisp has multiple namespaces to handle naming clashes. For the rare edge cases, check the source code.

Another change is that certain constants have been changed to Common Lisp keywords. Keyboard functions in C use an enum values corresponding to the key but cl-liballegro uses keywords instead. An example is `ALLEGRO_KEY_K` becoming `:K`. CFFI takes care of translating the value to the keyword and vice-versa. Using keywords over constants tends to be convenient in practice.


<a id="org3bdcdbc"></a>

## CFFI

Occasionally dropping down to a level lower using CFFI is necessary. One of these situations is passing a non-opaque data structure by reference.

Consider this block of C:

```c
{
  ALLEGRO_EVENT event;
  bool running = true;
  while (running) process_event(&event);
}
```

In Common Lisp we will use CFFI to allocate the structure for the corresponding Allegro 5 functions. Remember to free up the memory afterwards!

```lisp
(defparameter *running-p* t)
(let ((event (cffi:foreign-alloc '(:union al:event)))
  (loop while *running-p* do (process-event event))
  (cffi:foreign-free event))
```


<a id="org8f15ba9"></a>

## Orphaned Windows / Cleaning up Windows

At times when something goes wrong the debugger pops up and a new window is created without the previous one being destroyed. This is due to how Common Lisp debugger restarts execution. One of the ways to handle this is wrapping things in an `UNWIND-PROTECT` or using the condition handlers in Common Lisp. Errors should be handled in such a way that restarts do not re-execute certain s-exps to create a new display. Errors can also be handled by cleaning up resources.


<a id="org925e03c"></a>

## Optional Lisp Interface

An optional lisp interface is included with cl-liballegro which provides a full game loop with a fixed timestep and Entity Component System (ECS) implemented on the CLOS. Note that it is provided as is and not optimized. If performance is a concern, it is recommended to implement your own game loop while avoiding multiple dispatch and I will look forward to seeing your AAA game in the future.

1.  Define system which holds state
    
    ```lisp
    ;; Creates a 800x600 resizable OpenGL display titled "Simple"
    ;; Fixed timestep loop runs logic at 1 FPS
    ;; The remaining time is spent on render
    ;;
    ;; The PREVIOUS-KEY slot is user-defined state for this example
    (defclass window (al:system)
      ((previous-key :initform "Nothing" :accessor previous-key))
      (:default-initargs
       :title "Simple"
       :width 800 :height 600
       :logic-fps 1
       :display-flags '(:windowed :opengl :resizable)
       :display-options '((:sample-buffers 1 :suggest)
                          (:samples 4 :suggest))))
    ```

2.  Implement Method for Logic
    
    ```lisp
    (defmethod al:update ((sys window))
      (print 'one-logic-frame))
    ```

3.  Implement Method for Render
    
    ```lisp
    (defmethod al:render ((sys window))
      (al:clear-to-color (al:map-rgb 20 150 100))
      (al:flip-display))
    ```

4.  Implement Methods(s) for Handler
    
    ```lisp
    ;; The lisp interface uses this handler in the background of the logic
    (defmethod al:key-down-handler ((sys window))
      (let ((keyboard (cffi:mem-ref (al:event sys) '(:struct al:keyboard-event))))
        (print (getf keyboard 'al::keycode))
        (setf (previous-key sys) (getf keyboard 'al::keycode))))
    ```

5.  Run system
    
    ```lisp
    (al:run-system (make-instance 'window)))
    ```


<a id="org9166168"></a>

## Mac OS X - Main UI Thread

Running on Mac OS X tends to behave oddly with threads because it requires GUI related code to run in the main thread (affects programs outside of Common Lisp too). The Allegro 5 library has a solution with [al\_run\_main](https://liballeg.org/a5docs/trunk/misc.html#al_run_main). Define a callback with [defcallback](https://common-lisp.net/project/cffi/manual/html_node/defcallback.html) and pass it to `AL:RUN-MAIN`.

```lisp
;; First define a callback
(cffi:defcallback my-main :void ()
  ;; Code goes in here
  (function-with-gui-code))

;; Second execute by passing the callback to AL:RUN-MAIN
(al:run-main 0 (cffi:null-pointer) (cffi:callback my-main))
```


<a id="orga44d3cd"></a>

## Ignoring Floating Point Calculation Errors / Traps

Common Lisp implementations tend to throw floating point calculation errors such as `FLOATING-POINT-OVERFLOW` and `FLOATING-POINT-INVALID-OPERATION` by default (called traps) to be explicitly handled rather than ignored. There are situations where this is valid behaviour but sometimes such errors get thrown despite valid code being called through the foreign function interface (FFI).

In this case it should be safe to ignore using implementation specific routines or the [float-features](https://github.com/Shinmera/float-features/) portability library:

```lisp
;; SBCL
;; Sets traps globally
(sb-int:set-floating-point-modes :traps (:invalid :inexact :overflow))

;; SBCL
;; Code wrapped in the macro ignores floating point errors in the list
(sb-int:with-float-traps-masked (:invalid :inexact :overflow)
  (function-with-floating-point-errors))

;; float-features (portability library)
;; Code wrapped in the macro ignores floating point errors in the list
(float-features:with-float-traps-masked (:divide-by-zero
                                         :invalid
                                         :inexact
                                         :overflow
                                         :underflow)
  (function-with-floating-point-errors))
```


<a id="org85d0467"></a>

## Windows - Library Paths

There are path problems in Windows because the Allegro 5 library files which contain all the functions the CFFI calls upon do not have a default location unlike Unix environments. When the library is loaded under Windows, CFFI will look for the library files in the **current folder** of the FILE.LISP that evaluates `(ql:quickload "cl-liballegro")`. This means a copy of the library files must be in the directory of FILE.LISP, not in the cl-liballegro directory unless the FILE.LISP is in there. SLIME however, likes to change the default search folder to the one Emacs is in when it starts.


<a id="org55245c9"></a>

### With SBCL

```
;; Open command prompt in the folder that contains both the DLL and game.lisp
> sbcl
> (load "game.lisp") ; File contains (ql:quickload "cl-liballegro")
```


<a id="orgede031d"></a>

### With Emacs + SLIME

*game.lisp contains (ql:quickload :cl-liballegro)*

```
;; Looks for the DLL at /path/to/Desktop/allegro.dll
C-x C-f /path/to/Desktop/file9.lisp
M-x slime
C-x C-f /path/to/Desktop/game/game.lisp
C-c C-l
```

```
;; Looks for the DLL at /path/to/Desktop/game/allegro.dll
C-x C-f /path/to/Desktop/file9.lisp
C-x C-f /path/to/Desktop/game/game.lisp
M-x slime
C-c C-l
```

```
;; Looks for the DLL at /whatever/default/emacs/directory/allegro.dll
M-x slime
C-x C-f /path/to/Desktop/game/game.lisp
C-c C-l
```


<a id="org4751a24"></a>

# Contributing / Developing / Hacking

cl-liballegro is organized according to the [Allegro 5 Documentation](https://liballeg.org/a5docs/trunk/) with functions, types, and constants separated.

[CFFI](https://cffi.common-lisp.dev/) is used and its [manual](https://cffi.common-lisp.dev/manual/index.html) recommended to understand more advanced uses though not required for most cases.

Naming conventions has a preference for truncating `ALLEGRO` or `al` for user convenience since Common Lisp has multiple namespaces for resolving symbol names. For the rare edge cases, check the [types](./src/types/) and [constants](./src/constants/)

Usage of keywords over enums preferred for user convenience.


<a id="orgbc757b5"></a>

## Project Structure

-   <./src/constants/>: Allegro 5 constants, enums, and flag definitions
-   <./src/ffi-functions/>: Allegro 5 function definitions
-   <./src/types/>: Allegro 5 type definitions
-   <./src/interface/>: Common Lisp interface definition, optional fixed timestep game loop implemented with CLOS
-   <./src/package.lisp>: Common Lisp package definition, exports usable symbols
-   <./src/library.lisp>: CFFI library definition, loads Allegro 5 library files into memory
-   <./cl-liballegro.asd>: ASDF project definition, specifies source files to be loaded


<a id="org6aef0c5"></a>

## Checklist

-   [ ] New bindings added for export to [package defintion](./src/package.lisp)
-   [ ] New source files added for loading to the [project definition](./cl-liballegro.asd)


<a id="orgf411852"></a>

# [CHANGELOG](./CHANGELOG.md)

FYI these bindings are so stable it can make the repo look dead


<a id="orgd76da2d"></a>

# Support / Help / Bug Reports

Feel free to raise an issue on [GitHub](https://github.com/resttime/cl-liballegro)


<a id="org475a91d"></a>

# License

Project under zlib license