(in-package #:cl-liballegro)

;;; Audio codecs addon
(defcfun ("al_init_acodec_addon" init-acodec-addon) :boolean)
(defcfun ("al_get_allegro_acodec_version" get-allegro-acodec-version) :uint32)
