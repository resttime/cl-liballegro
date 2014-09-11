(in-package #:cl-liballegro)

;;; Image I/O addon
(defcfun ("al_init_image_addon" init-image-addon) :boolean)
(defcfun ("al_shutdown_image_addon" shutdown-image-addon) :void)
(defcfun ("al_get_allegro_image_version" get-allegro-image-version) :uint32)
