cl-liballegro
==========

`(require "cl-liballegro") ; ASDF system working`

Description
--------------

This is going to be a formal CFFI of the Allegro 5 programming library
that will be organized by sections of the API reference manual.

I hope for it to be as clean and neat as cl-opengl.

This will take a while to complete...
http://alleg.sourceforge.net/a5docs/5.0.8/

Usages
--------------
- `al_*` becomes `al:*`
- Do not pass ALLEGRO_COLOR to functions, use four floats instead. (CFFI cannot pass structures by value, only pointers)

Examples

`(al:init)` - `al_init();`

`(al:uninstall-system)` - `al_uninstall_system();`

`(al:install-mouse)` - `al_installmouse();`

`(al:clear-to-color 1.0 0.0 0.0 1.0)` - `al_clear_to_color(some_random_allegro_color_structure);`

`(al:draw-bitmap sprite 200 300 0)` - `al_draw_bitmap(sprite, 200, 300, 0);`



Progress
--------------
**I am using unverified, estimated percentages**

Configuration Files **[95%]**
Display **[80%]?**
Events - **[80%]**
File I/O - **[5%]**
Filesystem - **[5%]**
Fixed point math - **[10%]**
Fullscreen modes - **[95%]**
Graphics - **[85%]**
Joystick - **[90%]**
Keyboard - **[90%]**
Memory - **[???%]**
Mouse - **[95%]**
Path - **[95%]**
State - **[95%]**
System - **[95%]**
Threads - **[0%]**
Time - **[95%]**
Timer - **[95%]**
Transformations - **[95%]**
UTF-8 - **[0%]**
Miscellaneous - **[99%]**
Platform-specific - **[0%]**
Direct3D - **[0%]**
OpenGL - **[0%]**

Audio addon - **[95%]**
Audio codecs - **[99%]**
Color addon - **[0%]**
Font addons - **[20%]**
Image I/O addon - **[95%]**
Main addon - **[???%]**
Memfile addon - **[95%]**
Native dialogs addon - **[95%]**
PhysicsFS addon - **[95%]**
Primitives addon - **[5%]**
