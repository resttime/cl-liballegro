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

(declaim (inline get-joystick-state-axis))
(defun get-joystick-state-axis (state &key stick index)
  (the (single-float -1.0 1.0)
       (mem-aref (foreign-slot-value state '(:struct joystick-state)
                                     'stick-axis)
                 :float (+ (* stick al:+max-joystick-axes+) index))))

(defmacro with-joystick-state-axes ((&rest axes) state &body body)
  (let* ((axes-names (mapcar #'first axes))
         (axes-params (mapcar #'rest axes))
         (axes-sticks (mapcar (lambda (a) (getf a :stick)) axes-params))
         (axes-index (mapcar (lambda (a) (getf a :index)) axes-params)))
    `(let (,@(mapcar
               (lambda (name stick index)
                 `(,name
                   (get-joystick-state-axis ,state :stick ,stick :index ,index)))
               axes-names axes-sticks axes-index))
       (declare (type (single-float -1.0 1.0) ,@axes-names))
       ,@body)))

(declaim (inline get-joystick-state-button))
(defun get-joystick-state-button (state &key index)
  (the (integer 0 32767)
       (mem-aref (foreign-slot-value state '(:struct joystick-state)
                                     'button)
                 :int index)))

(defmacro with-joystick-state-buttons ((&rest buttons) state &body body)
  (let* ((buttons-names (mapcar #'first buttons))
         (buttons-params (mapcar #'rest buttons))
         (buttons-indices (mapcar (lambda (b) (getf b :index)) buttons-params)))
    `(let* (,@(mapcar (lambda (name index)
                        `(,name
                          (get-joystick-state-button ,state :index ,index)))
                      buttons-names buttons-indices))
       (declare (type (integer 0 32767) ,@buttons-names))
       ,@body)))
