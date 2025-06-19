(in-package #:cl-liballegro)

(defcstruct joystick)
(defcstruct joystick-state
  (stick-axis :float :count #.(* +max-joystick-sticks+ +max-joystick-axes+))
  (button :int :count #.+max-joystick-buttons+))

(defmacro with-joystick-state (state &body body)
  `(with-foreign-object (,state '(:struct al:joystick-state))
     ,@body))

(defmacro with-current-joystick-state (state joystick &body body)
  `(with-joystick-state ,state
     (al:get-joystick-state ,joystick ,state)
     ,@body))

(defmacro with-joystick-state-slots ((&rest slots) state &body body)
  `(with-foreign-slots
       (,(%foreign-slot-spec slots '(stick-axis button))
        ,state (:struct al:joystick-state))
     ,@body))

(defmacro with-joystick-axis ((value &key stick index) state &body body)
  `(let ((,value
           (mem-aref
            (foreign-slot-value ,state '(:struct al:joystick-state)
                                'al::stick-axis)
            :float (+ (* ,stick al:+max-joystick-axes+) ,index))))
     (declare (type (single-float -1.0 1.0) ,value))
     ,@body))

(defmacro with-joystick-axes ((&rest axes) state &body body)
  (let* ((axes-names (mapcar #'first axes))
         (axes-params (mapcar #'rest axes))
         (axes-sticks (mapcar (lambda (a) (getf a :stick)) axes-params))
         (axes-index (mapcar (lambda (a) (getf a :index)) axes-params))
         (axis-var (gensym "STICK-AXIS")))
    `(let* ((,axis-var
              (foreign-slot-value ,state '(:struct al:joystick-state)
                                  'al::stick-axis))
            ,@(mapcar
                (lambda (name stick index)
                  `(,name
                    (mem-aref
                     ,axis-var
                     :float (+ (* ,stick al:+max-joystick-axes+) ,index))))
                axes-names axes-sticks axes-index))
       (declare (type (single-float -1.0 1.0) ,@axes-names))
       ,@body)))

(defmacro with-joystick-button ((value &key index) state &body body)
  `(let ((,value
           (mem-aref
            (foreign-slot-value ,state '(:struct al:joystick-state)
                                'al::button)
            :int ,index)))
     (declare (type (integer 0 32767) ,value))
     ,@body))

(defmacro with-joystick-buttons ((&rest buttons) state &body body)
  (let* ((buttons-names (mapcar #'first buttons))
         (buttons-params (mapcar #'rest buttons))
         (buttons-indices (mapcar (lambda (b) (getf b :index)) buttons-params))
         (buttons-var (gensym "BUTTONS")))
    `(let* ((,buttons-var
              (foreign-slot-value ,state '(:struct al:joystick-state)
                                  'al::button))
            ,@(mapcar (lambda (name index)
                        `(,name (mem-aref ,buttons-var :int ,index)))
                      buttons-names buttons-indices))
       (declare (type (integer 0 32767) ,@buttons-names))
       ,@body)))
