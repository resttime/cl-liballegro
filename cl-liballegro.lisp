(ql:quickload "cffi")

(defpackage #:cl-liballegro
  (:use #:cl #:cffi))
(in-package #:cl-liballegro)

(define-foreign-library liballegro
  (:windows "allegro-5.0.8-monolith-mt.dll")
  (:unix (:default "liballegro")))
(use-foreign-library liballegro)

(define-foreign-library liballegro-acodec
  (:unix (:default "liballegro_acodec")))
(use-foreign-library liballegro-acodec)

(define-foreign-library liballegro-audio
  (:unix (:default "liballegro_audio")))
(use-foreign-library liballegro-audio)

(define-foreign-library liballegro-color
  (:unix (:default "liballegro_color")))
(use-foreign-library liballegro-color)

(define-foreign-library liballegro-dialog
  (:unix (:default "liballegro_dialog")))
(use-foreign-library liballegro-dialog)

(define-foreign-library liballegro-font
  (:unix (:default "liballegro_font")))
(use-foreign-library liballegro-font)

(define-foreign-library liballegro-image
  (:unix (:default "liballegro_image")))
(use-foreign-library liballegro-image)

(define-foreign-library liballegro-memfile
  (:unix (:default "liballegro_memfile")))
(use-foreign-library liballegro-memfile)

(define-foreign-library liballegro-physfs
  (:unix (:default "liballegro_physfs")))
(use-foreign-library liballegro-physfs)

(define-foreign-library liballegro-primitives
  (:unix (:default "liballegro_primitives")))
(use-foreign-library liballegro-primitives)

(define-foreign-library liballegro-ttf
  (:unix (:default "liballegro_ttf")))
(use-foreign-library liballegro-ttf)

(defcstruct allegro-config)

(defcfun ("al_create_config" create-config) :pointer)
