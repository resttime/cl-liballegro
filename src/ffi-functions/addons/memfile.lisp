(in-package #:cl-liballegro)

;;; Memfile addon
(defcfun ("al_open_memfile" open-memfile) :pointer
  (mem :pointer) (size :int64) (mode :pointer))
(defcfun ("al_get_allegro_memfile_version" get-allegro-memfile-version) :uint32)
