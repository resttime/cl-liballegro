(in-package #:cl-liballegro)

;;; System
(defcfun ("al_install_system" install-system) :boolean
  (version :int) (atexit-ptr :pointer))
(defun init () (install-system (get-allegro-version) (null-pointer)))
(defcfun ("al_uninstall_system" uninstall-system) :void)
(defcfun ("al_is_system_installed" is-system-installed) :boolean)
(defcfun ("al_get_allegro_version" get-allegro-version) :uint32)
(defcfun ("al_get_standard_path" get-standard-path) :pointer (id path-id))
(defcfun ("al_set_exe_name" set-exe-name) :void (path :string))
(defcfun ("al_set_app_name" set-app-name) :void (app-name :string))
(defcfun ("al_set_org_name" set-org-name) :void (org-name :string))
(defcfun ("al_get_app_name" get-app-name) :string)
(defcfun ("al_get_org_name" get-org-name) :string)
(defcfun ("al_get_system_config" get-system-config) :pointer)
(defcfun ("al_register_assert_handler" register-assert-handler) :void
  (handler :pointer))
(defcfun ("al_register_trace_handler" register-trace-handler) :void
  (handler :pointer))
(defcfun ("al_get_cpu_count" get-cpu-count) :int)
(defcfun ("al_get_ram_size" get-ram-size) :int)
