(in-package #:cl-liballegro)

(defcfun ("al_create_fs_entry" create-fs-entry) (:pointer (:struct fs-entry))
  (path :string))
(defcfun ("al_destroy_fs_entry" destroy-fs-entry) :void
  (fh (:pointer (:struct fs-entry))))
(defcfun ("al_get_fs_entry_name" get-fs-entry-name) :string
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_update_fs_entry" update-fs-entry) :bool
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_get_fs_entry_mode" get-fs-entry-mode) :uint32
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_get_fs_entry_atime" get-fs-entry-atime) time_t
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_get_fs_entry_ctime" get-fs-entry-ctime) time_t
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_get_fs_entry_mtime" get-fs-entry-mtime) time_t
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_get_fs_entry_size" get-fs-entry-size) off_t
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_fs_entry_exists" fs-entry-exists) :bool
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_remove_fs_entry" remove-fs-entry) :bool
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_filename_exists" filename-exists) :bool
  (path :string))
(defcfun ("al_remove_filename" remove-filename) :bool
  (path :string))

;; Directory functions
(defcfun ("al_open_directory" open-directory) :bool
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_read_directory" read-directory) (:pointer (:struct fs-entry))
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_close_directory" close-directory) :bool
  (e (:pointer (:struct fs-entry))))
(defcfun ("al_get_current_directory" get-current-directory) :string)
(defcfun ("al_change_directory" change-directory) :bool
  (path :string))
(defcfun ("al_make_directory" make-directory) :bool
  (path :string))
(defcfun ("al_open_fs_entry" open-fs-entry) (:pointer (:struct file))
  (e (:pointer (:struct fs-entry))) (mode :string))
(defcfun ("al_for_each_fs_entry" for-each-fs-entry) :int
  (dir (:pointer (:struct fs-entry)))
  (callback :pointer)
  (extra :pointer))

;; Alternative filesystem functions
(defcfun ("al_set_fs_interface" set-fs-interface) :void
  (fs-interface (:pointer (:struct fs-interface))))
(defcfun ("al_set_standard_fs_interface" set-standard-fs-interface) :void)
(defcfun ("al_get_fs_interface" get-fs-interface) (:pointer (:struct fs-interface)))
