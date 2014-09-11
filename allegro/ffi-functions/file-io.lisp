(in-package #:cl-liballegro)

(defcfun ("al_fclose" fclose) :void (file :pointer))