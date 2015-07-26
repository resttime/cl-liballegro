(in-package #:cl-liballegro)

;;; PhysicsFS addon
(defcfun ("al_set_physfs_file_interface" set-physfs-file-interface) :void)
(defcfun ("al_get_allegro_physfs_version" get-allegro-physfs-version) :uint32)
