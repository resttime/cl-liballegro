;;;; Gray streams for file APIs
(in-package #:cl-liballegro)

;;; Condition helpers
(declaim (ftype (function (string) string) prompt-for-string))
(defun prompt-for-string (prompt)
  "Prompts for a string value from *QUERY-IO*. To be used with interactive
restarts."
  (format *query-io* prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(declaim (ftype (function (function string &rest t) cffi:foreign-pointer)
                ensure-loaded))
(defun ensure-loaded (load-fn file-name &rest rest)
  "Calls LOAD-FN (which can be #'FOPEN, #'LOAD-BITMAP, #'LOAD-SAMPLE or similar)
with the FILE-NAME argument and REST arguments, if any. If LOAD-FN returns
non-null pointer, it is returned. Otherwise the error is raised, with
interactive restart allowing to specify another filename."
  (values
   (restart-case
       (let ((file (apply load-fn file-name rest)))
         (declare (type cffi:foreign-pointer file))
         (if (cffi:null-pointer-p file)
             (error "Failed to load '~a'" file-name)
             file))
     (retry-loading ()
       :report "Retry loading"
       (apply #'ensure-loaded load-fn file-name rest))
     (specify-filename (new-file-name)
       :report "Specify another file name"
       :interactive (lambda ()
                      (list
                       (prompt-for-string
                        "Please specify another file name: ")))
       (apply #'ensure-loaded load-fn new-file-name rest)))))

;;; CHARACTER-STREAM class
(defclass character-stream
    (trivial-gray-streams:fundamental-character-input-stream)
  ((path :initarg :path :initform (error "Missing required PATH argument"))
   (file))
  (:documentation
   "Wrapper around liballegro file IO to manipulate read-only text file."))

(declaim (ftype (function ((or pathname string)) character-stream)
                make-character-stream))
(defun make-character-stream (path)
  "Convenience constructor function for CHARACTER-STREAM."
  (make-instance 'character-stream
                 :path (if (typep path 'pathname)
                           (namestring path)
                           path)))

(defmethod initialize-instance :after ((stream character-stream) &key)
  (with-slots (path file) stream
    (setf file (ensure-loaded #'fopen path "r"))))

(defmethod trivial-gray-streams:stream-read-char ((stream character-stream))
  (with-slots (path file) stream
    (let ((char (fgetc file)))
      (declare (type fixnum char))
      (if (minusp char)
          (if (feof file)
              :eof
              (error "Error reading '~a'. ~a" path (ferrmsg file)))
          (code-char char)))))

(defmethod trivial-gray-streams:stream-read-sequence ((stream character-stream)
                                                      sequence start end
                                                      &key &allow-other-keys)
  (declare (type fixnum start end))
  (with-slots (path file) stream
    (let* ((length (- end start))
           actual-length
           (result
             (cffi:with-foreign-pointer-as-string (buffer length
                                                          :count actual-length)
               (setf actual-length (fread file buffer length))
               (when (ferror file)
                 (error "Error reading '~a'. ~a" path (ferrmsg file))))))
      (replace sequence result :start1 start :end1 end)
      actual-length)))

(defmethod trivial-gray-streams:stream-unread-char ((stream character-stream)
                                                    char)
  (with-slots (file) stream
    (fungetc file (char-code char))))

(defmethod trivial-gray-streams:stream-file-position ((stream character-stream))
  (with-slots (file) stream
    (ftell file)))

(defmethod (setf trivial-gray-streams:stream-file-position)
    (newval (stream character-stream))
  (with-slots (file) stream
    (fseek file newval 0)))

(defmethod trivial-gray-streams::close ((stream character-stream) &key abort)
  (declare (ignore abort))
  (with-slots (file) stream
    (fclose file)
    (setf file (cffi:null-pointer))))

;;; BINARY-STREAM class
(defclass binary-stream (trivial-gray-streams:fundamental-binary-input-stream)
  ((path :initarg :path :initform (error "Missing required PATH argument"))
   (file))
  (:documentation
   "Wrapper around liballegro file IO to manipulate read-only binary file."))

(declaim (ftype (function ((or pathname string)) binary-stream)
                make-binary-stream))
(defun make-binary-stream (path)
  "Convenience constructor function for BINARY-STREAM."
  (make-instance 'binary-stream
                 :path (if (typep path 'pathname)
                           (namestring path)
                           path)))

(defmethod initialize-instance :after ((stream binary-stream) &key)
  (with-slots (path file) stream
    (setf file (ensure-loaded #'fopen path "rb"))))

(defmethod trivial-gray-streams::stream-element-type ((stream binary-stream))
  '(unsigned-byte))

(defmethod trivial-gray-streams:stream-read-byte ((stream binary-stream))
  (with-slots (path file) stream
    (let ((char (fgetc file)))
      (declare (type fixnum char))
      (if (minusp char)
          (if (feof file)
              :eof
              (error "Error reading '~a'. ~a" path (ferrmsg file)))
          char))))

(defmethod trivial-gray-streams:stream-read-sequence ((stream binary-stream)
                                                      sequence start end
                                                      &key &allow-other-keys)
  (declare (type fixnum start end))
  (with-slots (path file) stream
    (cffi:with-pointer-to-vector-data (buffer sequence)
      (let ((pointer (cffi:inc-pointer buffer start)))
        (+ start (fread file pointer (- end start)))))))

(defmethod trivial-gray-streams:stream-file-position ((stream binary-stream))
  (with-slots (file) stream
    (ftell file)))

(defmethod (setf trivial-gray-streams:stream-file-position)
    (newval (stream binary-stream))
  (with-slots (file) stream
    (fseek file newval 0)))

(defmethod trivial-gray-streams::close ((stream binary-stream) &key abort)
  (declare (ignore abort))
  (with-slots (file) stream
    (fclose file)
    (setf file (cffi:null-pointer))))

;;; STREAM-SIZE helper
(declaim (ftype (function ((or character-stream binary-stream)) fixnum)
                stream-size))
(defun stream-size (stream)
  "Returns the file size for BINARY-STREAM and CHARACTER-STREAM."
  (with-slots (file) stream
    (fsize file)))
