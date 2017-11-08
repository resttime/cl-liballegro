(in-package #:cl-liballegro)

(define-foreign-library liballegro
  (:windows "allegro_monolith-5.2.2.dll")
  (:unix (:or "liballegro.so.5.2.2" "liballegro.so"))
  (t (:default "liballegro")))
(use-foreign-library liballegro)

(define-foreign-library liballegro-acodec
  (:unix (:or "liballegro_acodec.so.5.2.2" "liballegro_acodec.so"))
  (t (:default "liballegro_acodec")))
(use-foreign-library liballegro-acodec)

(define-foreign-library liballegro-audio
  (:unix (:or "liballegro_audio.so.5.2.2" "liballegro_audio.so"))
  (t (:default "liballegro_audio")))
(use-foreign-library liballegro-audio)

(define-foreign-library liballegro-color
  (:unix (:or "liballegro_color.so.5.2.2" "liballegro_color.so"))
  (t (:default "liballegro_color")))
(use-foreign-library liballegro-color)

(define-foreign-library liballegro-dialog
  (:unix (:or "liballegro_dialog.so.5.2.2" "liballegro_dialog.so"))
  (t (:default "liballegro_dialog")))
(use-foreign-library liballegro-dialog)

(define-foreign-library liballegro-font
  (:unix (:or "liballegro_font.so.5.2.2" "liballegro_font.so"))
  (t (:default "liballegro_font")))
(use-foreign-library liballegro-font)

(define-foreign-library liballegro-image
  (:unix (:or "liballegro_image.so.5.2.2" "liballegro_image.so"))
  (t (:default "liballegro_image")))
(use-foreign-library liballegro-image)

(define-foreign-library liballegro-memfile
  (:unix (:or "liballegro_memfile.so.5.2.2" "liballegro_memfile.so"))
  (t (:default "liballegro_memfile")))
(use-foreign-library liballegro-memfile)

(define-foreign-library liballegro-physfs
  (:unix (:or "liballegro_physfs.so.5.2.2" "liballegro_physfs.so"))
  (t (:default "liballegro_physfs")))
(use-foreign-library liballegro-physfs)

(define-foreign-library liballegro-primitives
  (:unix (:or "liballegro_primitives.so.5.2.2" "liballegro_primitives.so"))
  (t (:default "liballegro_primitives")))
(use-foreign-library liballegro-primitives)

(define-foreign-library liballegro-ttf
  (:unix (:or "liballegro_ttf.so.5.2.2" "liballegro_ttf.so"))
  (t (:default "liballegro_ttf")))
(use-foreign-library liballegro-ttf)

(define-foreign-library liballegro-video
  (:unix (:or "liballegro_video.so.5.2.2" "liballegro_video.so"))
  (t (:default "liballegro_video")))
(use-foreign-library liballegro-video)
