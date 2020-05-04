(in-package #:cl-liballegro)

;;; Default
(define-foreign-type c-float ()
  ()
  (:actual-type :float)
  (:simple-parser c-float))
(defmethod translate-to-foreign (value (type c-float)) (float value 0f0))
(defmethod translate-into-foreign-memory (value (type c-float) pointer)
  (translate-into-foreign-memory (translate-to-foreign value type)
                                 (make-instance 'cffi::foreign-built-in-type
                                                :type-keyword :float)
                                 pointer))

(define-foreign-type c-double ()
  ()
  (:actual-type :double)
  (:simple-parser c-double))
(defmethod translate-to-foreign (value (type c-double)) (float value 0d0))
(defmethod translate-into-foreign-memory (value (type c-double) pointer)
  (translate-into-foreign-memory (translate-to-foreign value type)
                                 (make-instance 'cffi::foreign-built-in-type
                                                :type-keyword :double)
                                 pointer))

(define-foreign-type c-int ()
  ()
  (:actual-type :int)
  (:simple-parser c-int))
(defmethod translate-to-foreign (value (type c-int)) (truncate value))
(defmethod translate-into-foreign-memory (value (type c-int) pointer)
  (translate-into-foreign-memory (translate-to-foreign value type)
                                 (make-instance 'cffi::foreign-built-in-type
                                                :type-keyword :int)
                                 pointer))

(define-foreign-type c-ptr ()
  ()
  (:actual-type :pointer)
  (:simple-parser c-ptr))
(defmethod translate-to-foreign (value (type c-ptr))
  (if (or (eql value 0) (eq value nil))
      (null-pointer)
      value))
(defmethod translate-into-foreign-memory (value (type c-ptr) pointer)
  (translate-into-foreign-memory (translate-to-foreign value type)
                                 (make-instance 'cffi::foreign-built-in-type
                                                :type-keyword :pointer)
                                 pointer))

(defctype time_t :long)
(defctype off_t :int)
