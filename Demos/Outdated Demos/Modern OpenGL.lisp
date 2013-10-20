(ql:quickload "cl-liballegro")
(ql:quickload "cl-opengl")

(defclass game (al:system)
  ((vao :accessor vao)
   (vb :accessor vb)
   (vertex-shader :accessor vertex-shader)
   (fragment-shader :accessor fragment-shader)
   (program :accessor program))
  (:default-initargs
   :width 300 :height 300
   :title "YEAH"
   :logic-fps 1
   :display-flags '(:opengl :opengl-3-0)
   :display-options '((:sample-buffers 1 :suggest)
		      (:samples 8 :suggest))))

(defmethod al:key-down-handler ((sys game))
  (print (cffi:foreign-slot-value (al:event sys)
				  '(:struct al:keyboard-event)
				  'al::keycode)))

(defmethod al:display-close-handler ((sys game))
  (setf (al:system-loop-running-p sys) nil))

(defmethod al:system-loop :before ((sys game))
  (setf (vao sys) (gl:gen-vertex-arrays 1))
  (setf (vb sys) (gl:gen-buffers 1))
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
  (let ((vs (gl:create-shader :vertex-shader))
	(fs (gl:create-shader :fragment-shader)))
    (create-shader :vertex-shader *vert-shader*)
    (setf (vertex-shader sys) vs)
    (setf (fragment-shader sys) fs)
    (gl:shader-source vs *vert-shader*)
    (gl:compile-shader vs)
    (gl:shader-source fs *frag-shader*)
    (gl:compile-shader fs)
    (setf (program sys) (gl:create-program))
    (gl:attach-shader (program sys) vs)
    (gl:attach-shader (program sys) fs)
    (print (gl:get-shader-info-log vs))
    (print (gl:get-shader-info-log fs))
    (gl:link-program (program sys))))

(defparameter *vert-shader*
  "#version 330 core

   layout(location = 0) in vec3 vertexPosition_modelspace;

   void main() {
       gl_Position.xyz = vertexPosition_modelspace;
       gl_Position.w = 1.0;
   }")
(defparameter *frag-shader*
  "#version 330 core
   out vec3 color;

   void main() {
       color = vec3(1,0,0);
   }")

(defmethod al:update ((sys game))
  (print 'update))
(defmethod al:render ((sys game))
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

;(al:run-system (make-instance 'game))
;(al:uninstall-system)

