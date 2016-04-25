(in-package #:cl-liballegro)

(defcfun ("al_create_config" create-config) :pointer)
(defcfun ("al_destroy_config" destroy-config) :void (config :pointer))
(defcfun ("al_load_config_file" load-config-file) :pointer (filename :string))
(defcfun ("al_load_config_file_f" load-config-file-f) :pointer (file :pointer))
(defcfun ("al_save_config_file" save-config-file) :boolean
  (filename :string) (config :pointer))
(defcfun ("al_save_config_file_f" save-config-file-f) :boolean
  (file :pointer) (config :pointer))
(defcfun ("al_add_config_section" add-config-section) :void
  (config :pointer) (name :string))
(defcfun ("al_remove_config_section" remove-config-section) :void
  (config :pointer) (section :string))
(defcfun ("al_add_config_comment" add_config_comment) :void
  (config :pointer) (section :string) (comment :string))
(defcfun ("al_get_config_value" get-config-value) :string
  (config :pointer) (section :string) (key :string))
(defcfun ("al_set_config_value" set-config-value) :void
  (config :pointer) (section :string) (key :string) (value :string))
(defcfun ("al_remove_config_key" remove-config-key) :bool
  (config :pointer) (section :string) (key :string))
(defcfun ("al_get_first_config_section" get-first-config-section) :string
  (config :pointer) (iterator :pointer))
(defcfun ("al_get_next_config_section" get-next-config-section) :string
  (iterator :pointer))
(defcfun ("al_get_first_config_entry" get-first-config-entry) :string
  (config :pointer) (section :string) (iterator :pointer))
(defcfun ("al_get_next_config_entry" get-next-config-entry) :pointer
  (iterator :pointer))
(defcfun ("al_merge_config" merge-config) :pointer
  (cfg1 :pointer) (cfg2 :pointer))
(defcfun ("al_merge_config_into" merge-config-into) :void
  (master :pointer) (add :pointer))
