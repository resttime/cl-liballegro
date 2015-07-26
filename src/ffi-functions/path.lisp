(in-package #:cl-liballegro)

;;; Path
(defcfun ("al_create_path" create-path) :pointer (str :string))
(defcfun ("al_create_path_for_directory" create-path-for-directory) :pointer
  (str :string))
(defcfun ("al_destroy_path" destroy-path) :void (path :pointer))
(defcfun ("al_clone_path" clone-path) :pointer (path :pointer))
(defcfun ("al_join_paths" join-paths) :boolean (path :pointer) (tail :pointer))
(defcfun ("al_rebase_path" rebase-path) :boolean (heard :pointer) (tail :pointer))
(defcfun ("al_get_path_drive" get-path-drive) :string (path :pointer))
(defcfun ("al_get_path_num_components" get-path-num-components) :int (path :pointer))
(defcfun ("al_get_path_component" get-path-component) :string
  (path :pointer) (i :int))
(defcfun ("al_get_path_tail" get-path-tail) :string (path :pointer))
(defcfun ("al_get_path_filename" get-path-filename) :string (path :pointer))
(defcfun ("al_get_path_basename" get-path-basename) :string (path :pointer))
(defcfun ("al_get_path_extension" get-path-extension) :string (path :pointer))
(defcfun ("al_set_path_drive" set-path-drive) :void
  (path :pointer) (drive :string))
(defcfun ("al_append_path_component" append-path-component) :void
  (path :pointer) (s :string))
(defcfun ("al_insert_path_component" insert-path-component) :void
  (path :pointer) (i :int) (s :string))
(defcfun ("al_replace_path_component" replace-path-component) :void
  (path :pointer) (i :int) (s :string))
(defcfun ("al_remove_path_component" remove-path-component) :void
  (path :pointer) (i :int))
(defcfun ("al_drop_path_tail" drop-path-tail) :void (path :pointer))
(defcfun ("al_set_path_filename" set-path-filename) :void
  (path :pointer) (filename :string))
(defcfun ("al_set_path_extension" set-path-extension) :boolean
  (path :pointer) (extension :string))
(defcfun ("al_path_cstr" path-cstr) :string (path :pointer) (delim :char))
(defcfun ("al_make_path_canonical" make-path-canonical) :boolean (path :pointer))
