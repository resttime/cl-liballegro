(ql:quickload "cffi")

(defpackage #:cl-liballegro
  (:use #:cl #:cffi)
  (:nicknames #:al)
  (:export
   
   ;; Configuration Files
   #:create-config
   #:destroy-config
   #:load-config-file
   #:load-config-file-f
   #:save-config-file
   #:save-config-file-f
   #:add-config-section
   #:remove-config-section
   #:add-config-comment
   #:get-config-value
   #:set-config-value
   #:get-first-config-section
   #:get-next-config-section
   #:get-first-config-entry
   #:get-next-config-entry
   #:merge-config
   #:merge-config-into))
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

;;; Configuration Files
(defcstruct allegro-config)

(defcfun ("al_create_config" create-config) :pointer)
(defcfun ("al_destroy_config" destroy-config) :void (config :pointer))
(defcfun ("al_load_config_file" load-config-file) :pointer (filename :pointer))
(defcfun ("al_load_config_file_f" load-config-file-f) :pointer (file :pointer))
(defcfun ("al_save_config_file" save-config-file) :boolean
  (filename :pointer) (config :pointer))
(defcfun ("al_save_config_file_f" save-config-file-f) :boolean
  (file :pointer) (config :pointer))
(defcfun ("al_add_config_section" add_config_section) :void
  (config :pointer) (name :pointer))
(defcfun ("al_add_config_comment" add_config_comment) :void
  (config :pointer) (section :pointer) (comment :pointer))
(defcfun ("al_get_config_value" get-config-value) :pointer
  (config :pointer) (section :pointer) (key :pointer))
(defcfun ("al_set_config_value" set-config-value) :void
  (config :pointer) (section :pointer) (key :pointer) (value :pointer))
(defcfun ("al_get_first_config_section" get-first-config-section) :pointer
  (config :pointer) (iterator :pointer))
(defcfun ("al_get_next_config_section" get-next-config-section) :pointer
  (iterator :pointer))
(defcfun ("al_get_first_config_entry" get-first-config-entry) :pointer
  (config :pointer) (section :pointer) (iterator :pointer))
(defcfun ("al_get_next_config_entry" get_next_config_entry) :pointer
  (iterator :pointer))
(defcfun ("al_merge_config" merge-config) :pointer
  (cfg1 :pointer) (cfg2 :pointer))
(defcfun ("al_merge_config_into" merge-config-into) :void
  (master :pointer) (add :pointer))

;;; Display
(defcstruct allegro-display)
