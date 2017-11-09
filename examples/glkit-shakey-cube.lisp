(ql:quickload "cl-liballegro")
(ql:quickload "cl-opengl")
(ql:quickload "glkit")

(kit.gl.shader:defdict all-shaders ()
  (kit.gl.shader:shader vertex :vertex-shader "
   #version 300 es
   precision highp float;

   layout(location = 0) in vec3 vertexPosition_modelspace;
   layout(location = 1) in vec3 vertexColor;

   out vec3 fragmentColor;

   uniform mat4 MVP;

   void main() {
       gl_Position = MVP * vec4(vertexPosition_modelspace, 1);
       fragmentColor = vertexColor;
   }")

  (kit.gl.shader:shader fragment :fragment-shader "
   #version 300 es
   precision highp float;

   in vec3 fragmentColor;

   out vec3 color;

   void main() {
       color = fragmentColor;
   }")
  (kit.gl.shader:program :simple-prog ((:mvp "MVP"))
			 (:vertex-shader vertex)
			 (:fragment-shader fragment)))
(defparameter *cube-data* #(
			    -1.0  -1.0  -1.0
			    -1.0  -1.0   1.0
			    -1.0   1.0   1.0
			    1.0   1.0  -1.0
			    -1.0  -1.0  -1.0
			    -1.0   1.0  -1.0
			    1.0  -1.0   1.0
			    -1.0  -1.0  -1.0
			    1.0  -1.0  -1.0
			    1.0   1.0  -1.0
			    1.0  -1.0  -1.0
			    -1.0  -1.0  -1.0
			    -1.0  -1.0  -1.0
			    -1.0   1.0   1.0
			    -1.0   1.0  -1.0
			    1.0  -1.0   1.0
			    -1.0  -1.0   1.0
			    -1.0  -1.0  -1.0
			    -1.0   1.0   1.0
			    -1.0  -1.0   1.0
			    1.0  -1.0   1.0
			    1.0   1.0   1.0
			    1.0  -1.0  -1.0
			    1.0   1.0  -1.0
			    1.0  -1.0  -1.0
			    1.0   1.0   1.0
			    1.0  -1.0   1.0
			    1.0   1.0   1.0
			    1.0   1.0  -1.0
			    -1.0   1.0  -1.0
			    1.0   1.0   1.0
			    -1.0   1.0  -1.0
			    -1.0   1.0   1.0
			    1.0   1.0   1.0
			    -1.0   1.0   1.0
			    1.0  -1.0   1.0
			    ))
(defparameter *color-data* #(
			     0.583   0.771   0.014
			     0.609   0.115   0.436
			     0.327   0.483   0.844
			     0.822   0.569   0.201
			     0.435   0.602   0.223
			     0.310   0.747   0.185
			     0.597   0.770   0.761
			     0.559   0.436   0.730
			     0.359   0.583   0.152
			     0.483   0.596   0.789
			     0.559   0.861   0.639
			     0.195   0.548   0.859
			     0.014   0.184   0.576
			     0.771   0.328   0.970
			     0.406   0.615   0.116
			     0.676   0.977   0.133
			     0.971   0.572   0.833
			     0.140   0.616   0.489
			     0.997   0.513   0.064
			     0.945   0.719   0.592
			     0.543   0.021   0.978
			     0.279   0.317   0.505
			     0.167   0.620   0.077
			     0.347   0.857   0.137
			     0.055   0.953   0.042
			     0.714   0.505   0.345
			     0.783   0.290   0.734
			     0.722   0.645   0.174
			     0.302   0.455   0.848
			     0.225   0.587   0.040
			     0.517   0.713   0.338
			     0.053   0.959   0.120
			     0.393   0.621   0.362
			     0.673   0.211   0.457
			     0.820   0.883   0.371
			     0.982   0.099   0.879
			     ))

(defclass game (al:system)
  ((vao :accessor vao)
   (vb :accessor vb)
   (shader-dict :accessor shader-dict))
  (:default-initargs
   :width 800 :height 600
   :title "Shakey Cube"
   :logic-fps 30
   :display-flags '(:opengl :opengl-3-0)
   :display-options '((:sample-buffers 1 :suggest)
		      (:samples 8 :suggest))))

(defun model-view-projection-matrix ()
  (let ((view (kit.glm:perspective-matrix 45 1024/768 0.1 100))
	(projection (kit.glm:look-at
		     (kit.glm:vec (* 0.5 (abs (cos (/ (get-internal-real-time) 900))))
				  (1+ (* 3.0 (abs (cos (/ (get-internal-real-time) 500)))))
				  (1+ (* 5 (abs (sin (/ (get-internal-real-time) 1000))))))
		     (kit.glm:vec 0.0 0.0 0.0)
		     (kit.glm:vec 0.0 1.0 0.0))))
    (kit.glm:matrix* kit.glm:+identity-matrix+ view projection)))

(defmethod al:system-loop :before ((sys game))
  (gl:enable :depth-test)
  (gl:depth-func :less)
  (setf (vao sys) (gl:gen-vertex-arrays 1))
  (gl:bind-vertex-array (first (vao sys)))

  (setf (vb sys) (gl:gen-buffers 2))
  (let* ((vert-data *cube-data*)
	 (arr (gl:alloc-gl-array :float (length vert-data))))
    (dotimes (i (length vert-data))
      (setf (gl:glaref arr i) (aref vert-data i)))
    (gl:bind-buffer :array-buffer (first (vb sys)))
    (gl:buffer-data :array-buffer :static-draw arr)
    (gl:free-gl-array arr))
  (let* ((vert-data *color-data*)
	 (arr (gl:alloc-gl-array :float (length vert-data))))
    (dotimes (i (length vert-data))
      (setf (gl:glaref arr i) (aref vert-data i)))
    (gl:bind-buffer :array-buffer (second (vb sys)))
    (gl:buffer-data :array-buffer :static-draw arr)
    (gl:free-gl-array arr))
  (format t "OpenGL Version: 0x~x~%" (al:get-opengl-version))
  (format t "OpenGL Variant: ~a~%" (al:get-opengl-variant)))

(defmethod al:render ((sys game))
  (setf (shader-dict sys)
        (kit.gl.shader:compile-shader-dictionary (kit.gl.shader:dict all-shaders)))
  (gl:clear-color 0.0 0.0 0.0 1.0)
  (gl:clear :color-buffer-bit :depth-buffer-bit)
  (kit.gl.shader:use-program (shader-dict sys) :simple-prog)
  (kit.gl.shader:uniform-matrix (shader-dict sys) :mvp 4 (vector (model-view-projection-matrix)))
  (gl:enable-vertex-attrib-array 0)
  (gl:bind-buffer :array-buffer (first (vb sys)))
  (gl:vertex-attrib-pointer 0 3 :float :false 0 (cffi:null-pointer))

  (gl:enable-vertex-attrib-array 1)
  (gl:bind-buffer :array-buffer (second (vb sys)))
  (gl:vertex-attrib-pointer 1 3 :float :false 0 (cffi:null-pointer))
  (gl:draw-arrays :triangles 0 (* 12 3))
  (gl:disable-vertex-attrib-array 0)
  (gl:disable-vertex-attrib-array 1)
  (gl:use-program 0)
  (al:flip-display))

(defun main ()
  (al:run-system (make-instance 'game)))
