(ql:quickload "cl-liballegro")
(ql:quickload "cl-opengl")

(defparameter *vert-shader*
  "#version 300 es

   layout(location = 0) in vec3 vertexPosition_modelspace;

   void main() {
       gl_Position.xyz = vertexPosition_modelspace;
       gl_Position.w = 1.0;
   }")
(defparameter *frag-shader*
  "#version 300 es
   precision highp float;

   out vec3 color;

   void main() {
       color = vec3(0.5,0.5,0.5);
   }")

(defclass game (al:system)
  ((vao :accessor vao)
   (vb :accessor vb)
   (vertex-shader :accessor vertex-shader)
   (fragment-shader :accessor fragment-shader)
   (program :accessor program))
  (:default-initargs
   :width 800 :height 600
   :title "Tutorial 2"
   :logic-fps 1
   :display-flags '(:opengl :opengl-3-0)
   :display-options '((:sample-buffers 1 :suggest)
        	      (:samples 8 :suggest))
   ))

(defgeneric load-shaders (sys &key vertex fragment))
(defmethod load-shaders ((sys game) &key vertex fragment)
  (let ((vs (gl:create-shader :vertex-shader))
	(fs (gl:create-shader :fragment-shader)))
    (setf (vertex-shader sys) vs)
    (setf (fragment-shader sys) fs)
    (gl:shader-source vs vertex)
    (gl:compile-shader vs)
    (gl:shader-source fs fragment)
    (gl:compile-shader fs)
    ;;(print (gl:get-shader-info-log vs))
    ;;(print (gl:get-shader-info-log fs))
    (setf (program sys) (gl:create-program))
    (gl:attach-shader (program sys) vs)
    (gl:attach-shader (program sys) fs)
    (gl:link-program (program sys))))

(defmethod al:system-loop :before ((sys game))
  (setf (vb sys) (gl:gen-buffers 1))
  (setf (vao sys) (gl:gen-vertex-arrays 1))
  (gl:bind-vertex-array (first (vao sys)))
  (gl:bind-buffer :array-buffer (first (vb sys)))
  (let ((vert-data #(-1.0 -1.0 0.0
		     1.0 -1.0 0.0
		     0.0 1.0 0.0))
	(arr (gl:alloc-gl-array :float 9)))
    (dotimes (i (length vert-data))
      (setf (gl:glaref arr i) (aref vert-data i)))
    (gl:buffer-data :array-buffer :static-draw arr)
    (gl:free-gl-array arr))
  (format t "OpenGL Version: 0x~x~%" (al:get-opengl-version))
  (format t "OpenGL Variant: ~a~%" (al:get-opengl-variant)))

(defmethod al:render ((sys game))
  (load-shaders sys :vertex *vert-shader* :fragment *frag-shader*)
  (gl:clear-color 0.0 0.0 0.0 1.0)
  (gl:clear :color-buffer-bit)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (gl:use-program (program sys))
  (gl:enable-vertex-attrib-array 0)
  (gl:bind-buffer :array-buffer (first (vb sys)))
  (gl:vertex-attrib-pointer 0 3 :float :false 0 (cffi:null-pointer))
  (gl:draw-arrays :triangles 0 3)
  (gl:disable-vertex-attrib-array 0)
  (gl:use-program 0)
  (al:flip-display))

(defun main ()
  (al:run-system (make-instance 'game)))
