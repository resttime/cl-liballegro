(in-package #:cl-liballegro)

(define-foreign-library liballegro
  (:windows "allegro-5.2.dll")
  (:unix (:or "liballegro.so.5.2.2" "liballegro.so.5.2"))
  (t (:default "liballegro")))
(use-foreign-library liballegro)

(define-foreign-library liballegro-main
  (:windows "allegro_main-5.2.dll")
  (:unix (:or "liballegro_main.so.5.2.2" "liballegro_main.so.5.2"))
  (t (:default "liballegro_main")))
(use-foreign-library liballegro-main)

(define-foreign-library liballegro-acodec
  (:windows "allegro_acodec-5.2.dll")
  (:unix (:or "liballegro_acodec.so.5.2.2" "liballegro_acodec.so.5.2"))
  (t (:default "liballegro_acodec")))
(use-foreign-library liballegro-acodec)

(define-foreign-library liballegro-audio
  (:windows "allegro_audio-5.2.dll")
  (:unix (:or "liballegro_audio.so.5.2.2" "liballegro_audio.so.5.2"))
  (t (:default "liballegro_audio")))
(use-foreign-library liballegro-audio)

(define-foreign-library liballegro-color
  (:windows "allegro_color-5.2.dll")
  (:unix (:or "liballegro_color.so.5.2.2" "liballegro_color.so.5.2"))
  (t (:default "liballegro_color")))
(use-foreign-library liballegro-color)

(define-foreign-library liballegro-dialog
  (:windows "allegro_dialog-5.2.dll")
  (:unix (:or "liballegro_dialog.so.5.2.2" "liballegro_dialog.so.5.2"))
  (t (:default "liballegro_dialog")))
(use-foreign-library liballegro-dialog)

(define-foreign-library liballegro-font
  (:windows "allegro_font-5.2.dll")
  (:unix (:or "liballegro_font.so.5.2.2" "liballegro_font.so.5.2"))
  (t (:default "liballegro_font")))
(use-foreign-library liballegro-font)

(define-foreign-library liballegro-image
  (:windows "allegro_image-5.2.dll")
  (:unix (:or "liballegro_image.so.5.2.2" "liballegro_image.so.5.2"))
  (t (:default "liballegro_image")))
(use-foreign-library liballegro-image)

(define-foreign-library liballegro-memfile
  (:windows "allegro_memfile-5.2.dll")
  (:unix (:or "liballegro_memfile.so.5.2.2" "liballegro_memfile.so.5.2"))
  (t (:default "liballegro_memfile")))
(use-foreign-library liballegro-memfile)

(define-foreign-library liballegro-physfs
  (:windows "allegro_physfs-5.2.dll")
  (:unix (:or "liballegro_physfs.so.5.2.2" "liballegro_physfs.so.5.2"))
  (t (:default "liballegro_physfs")))
(handler-case (use-foreign-library liballegro-physfs)
  (error (condition) (print "physfs library not found") condition))

(define-foreign-library liballegro-primitives
  (:windows "allegro_primitives-5.2.dll")
  (:unix (:or "liballegro_primitives.so.5.2.2" "liballegro_primitives.so.5.2"))
  (t (:default "liballegro_primitives")))
(use-foreign-library liballegro-primitives)

(define-foreign-library liballegro-ttf
  (:windows "allegro_ttf-5.2.dll")
  (:unix (:or "liballegro_ttf.so.5.2.2" "liballegro_ttf.so.5.2"))
  (t (:default "liballegro_ttf")))
(use-foreign-library liballegro-ttf)

(define-foreign-library liballegro-video
  (:windows "allegro_video-5.2.dll")
  (:unix (:or "liballegro_video.so.5.2.2" "liballegro_video.so"))
  (t (:default "liballegro_video")))
(handler-case (use-foreign-library liballegro-video)
  (error (condition) (print "Video Addon Available only in versions >=5.1.0") condition))
