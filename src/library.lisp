(in-package #:cl-liballegro)

(defmacro define-allegro-library (lib)
  "Use macro for easier versioning.  Debug using MACROEXPAND-1"
  `(define-foreign-library ,(intern (string-upcase lib))
     (:windows ,(concatenate 'string (subseq lib 3) "-5.2.dll"))
     (:darwin (:or ,(concatenate 'string lib ".5.2.6.dylib")
                   ,(concatenate 'string lib ".5.2.dylib")
                   ,(concatenate 'string lib ".dylib")))
     (:unix (:or ,(concatenate 'string lib ".so.5.2.6")
                 ,(concatenate 'string lib ".so.5.2")
                 ,(concatenate 'string lib ".so")))
     (t (:default ,(concatenate 'string lib)))))
;; ;; Example
;; (macroexpand-1 '(define-allegro-library "liballegro"))
;;
;; (DEFINE-FOREIGN-LIBRARY LIBALLEGRO
;;   (:WINDOWS "allegro-5.2.dll")
;;   (:UNIX (:OR "liballegro.so.5.2" "liballegro.so"))
;;   (T (:DEFAULT "liballegro")))


(define-allegro-library "liballegro")
(use-foreign-library liballegro)

(define-allegro-library "liballegro_acodec")
(use-foreign-library liballegro_acodec)

(define-allegro-library "liballegro_audio")
(use-foreign-library liballegro_audio)

(define-allegro-library "liballegro_color")
(use-foreign-library liballegro_color)

(define-allegro-library "liballegro_dialog")
(use-foreign-library liballegro_dialog)

(define-allegro-library "liballegro_font")
(use-foreign-library liballegro_font)

(define-allegro-library "liballegro_image")
(use-foreign-library liballegro_image)

(define-allegro-library "liballegro_memfile")
(use-foreign-library liballegro_memfile)

(define-allegro-library "liballegro_physfs")
(handler-case (use-foreign-library liballegro_physfs)
  (error (condition) (print "physfs library not found") condition))

(define-allegro-library "liballegro_primitives")
(use-foreign-library liballegro_primitives)

(define-allegro-library "liballegro_ttf")
(use-foreign-library liballegro_ttf)

(define-allegro-library "liballegro_video")
(handler-case (use-foreign-library liballegro_video)
  (error (condition) (print "Video Addon Available only in versions >=5.1.0") condition))
