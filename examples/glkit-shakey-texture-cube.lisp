(ql:quickload "cl-liballegro")
(ql:quickload "cl-opengl")
(ql:quickload "glkit")

(kit.gl.shader:defdict *all-shaders* ()
  (kit.gl.shader:shader vertex :vertex-shader "
   #version 300 es
   precision highp float;

   layout(location = 0) in vec3 vertexPosition_modelspace;
   layout(location = 1) in vec2 vertexUV;

   out vec2 UV;

   uniform mat4 MVP;

   void main() {
       gl_Position = MVP * vec4(vertexPosition_modelspace, 1);
       UV = vertexUV;
   }")

  (kit.gl.shader:shader fragment :fragment-shader "
   #version 300 es
   precision highp float;

   in vec2 UV;

   out vec3 color;

   uniform sampler2D textureSampler;

   void main() {
       color = texture(textureSampler, UV).rgb;
   }")
  (kit.gl.shader:program :simple-prog ((:mvp "MVP") (:ts "textureSampler"))
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
(defparameter *uv-data* `#(
			  0.000059  ,(1- 0.000004)
			  0.000103  ,(1- 0.336048)
			  0.335973  ,(1- 0.335903)
			  1.000023  ,(1- 0.000013)
			  0.667979  ,(1- 0.335851)
			  0.999958  ,(1- 0.336064)
			  0.667979  ,(1- 0.335851)
			  0.336024  ,(1- 0.671877)
			  0.667969  ,(1- 0.671889)
			  1.000023  ,(1- 0.000013)
			  0.668104  ,(1- 0.000013)
			  0.667979  ,(1- 0.335851)
			  0.000059  ,(1- 0.000004)
			  0.335973  ,(1- 0.335903)
			  0.336098  ,(1- 0.000071)
			  0.667979  ,(1- 0.335851)
			  0.335973  ,(1- 0.335903)
			  0.336024  ,(1- 0.671877)
			  1.000004  ,(1- 0.671847)
			  0.999958  ,(1- 0.336064)
			  0.667979  ,(1- 0.335851)
			  0.668104  ,(1- 0.000013)
			  0.335973  ,(1- 0.335903)
			  0.667979  ,(1- 0.335851)
			  0.335973  ,(1- 0.335903)
			  0.668104  ,(1- 0.000013)
			  0.336098  ,(1- 0.000071)
			  0.000103  ,(1- 0.336048)
			  0.000004  ,(1- 0.671870)
			  0.336024  ,(1- 0.671877)
			  0.000103  ,(1- 0.336048)
			  0.336024  ,(1- 0.671877)
			  0.335973  ,(1- 0.335903)
			  0.667969  ,(1- 0.671889)
			  1.000004  ,(1- 0.671847)
			  0.667979  ,(1- 0.335851)))

(defclass game (al:system)
  ((vao :accessor vao)
   (vb :initform '() :accessor vb)
   (texture :accessor texture)
   (shader-dict :accessor shader-dict))
  (:default-initargs
   :width 800 :height 600
   :title "Shakey Texture Cube"
   :logic-fps 30
   :display-flags '(:opengl :opengl-3-0)
   :display-options '((:sample-buffers 1 :suggest)
		      (:samples 8 :suggest))))

(defun model-view-projection-matrix ()
  (let ((view (kit.glm:perspective-matrix 45 1024/768 0.1 100))
	(projection (kit.glm:look-at
		     (kit.glm:vec (* 3.0 (cos (/ (get-internal-real-time) 200)))
				  (* 3.0 (cos (/ (get-internal-real-time) 200)))
				  (* 3.0 (sin (/ (get-internal-real-time) 200))))
		     (kit.glm:vec 0.0 0.0 0.0)
		     (kit.glm:vec 0.0 1.0 0.0))))
    (kit.glm:matrix* kit.glm:+identity-matrix+ view projection)))

(defgeneric add-buffer-data (sys buffer-data))
(defmethod add-buffer-data ((sys game) buffer-data)
  (let ((new-buffer (gl:gen-buffers 1))
	(arr (gl:alloc-gl-array :float (length buffer-data))))
    (dotimes (i (length buffer-data))
      (setf (gl:glaref arr i) (aref buffer-data i)))
    (gl:bind-buffer :array-buffer (first new-buffer))
    (gl:buffer-data :array-buffer :static-draw arr)
    (gl:free-gl-array arr)
    (setf (vb sys) (append (vb sys) new-buffer))))

(defmethod al:system-loop :before ((sys game))
  (let ((texture-path (namestring (asdf:system-relative-pathname
                                   "cl-liballegro" "examples/test.png"))))
    (gl:clear-color 0.0 0.0 0.0 1.0)
    (gl:enable :depth-test)
    (gl:depth-func :less)

    (setf (vao sys) (gl:gen-vertex-arrays 1))

    (gl:bind-vertex-array (first (vao sys)))

    (setf (shader-dict sys)
          (kit.gl.shader:compile-shader-dictionary (kit.gl.shader:dict *all-shaders*)))

    (setf (texture sys)
          (al:get-opengl-texture (al:load-bitmap texture-path)))

    (add-buffer-data sys *cube-data*)
    (add-buffer-data sys *uv-data*)

    (gl:bind-texture :texture-2d (texture sys))
    (gl:tex-parameter :texture-2d :texture-mag-filter :linear)
    (gl:tex-parameter :texture-2d :texture-min-filter :linear-mipmap-linear)
    (gl:tex-parameter :texture-2d :texture-wrap-s :repeat)
    (gl:tex-parameter :texture-2d :texture-wrap-t :repeat)
    (gl:generate-mipmap :texture-2d)))

(defmethod al:render ((sys game))
  (gl:clear :color-buffer-bit :depth-buffer-bit)
  (kit.gl.shader:use-program (shader-dict sys) :simple-prog)
  (kit.gl.shader:uniform-matrix (shader-dict sys) :mvp 4
                                (vector (model-view-projection-matrix)))

  (gl:active-texture :texture0)
  (gl:bind-texture :texture-2d (texture sys))
  (kit.gl.shader:uniformi (shader-dict sys) "textureSampler" 0)

  (gl:enable-vertex-attrib-array 0)
  (gl:bind-buffer :array-buffer (first (vb sys)))
  (gl:vertex-attrib-pointer 0 3 :float :false 0 (cffi:null-pointer))

  (gl:enable-vertex-attrib-array 1)
  (gl:bind-buffer :array-buffer (second (vb sys)))
  (gl:vertex-attrib-pointer 1 2 :float :false 0 (cffi:null-pointer))
  (gl:draw-arrays :triangles 0 (* 12 3))
  (gl:disable-vertex-attrib-array 0)
  (gl:disable-vertex-attrib-array 1)
  (gl:use-program 0)
  (al:flip-display))

(defun main ()
  (al:run-system (make-instance 'game)))
