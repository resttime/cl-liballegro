(in-package #:cl-liballegro)

;; Memory

;; #define al_malloc(n) (al_malloc_with_context((n), __LINE__, __FILE__, __func__))
;; #define al_free(p) (al_free_with_context((p), __LINE__, __FILE__, __func__))

(defun malloc (n) (malloc-with-context n 0 "" ""))
(defun free (p) (free-with-context p 0 "" ""))
(defcfun ("al_malloc_with_context" malloc-with-context) :pointer
  (n :uint) (line :int) (file :string) (func :string))
(defcfun ("al_free_with_context" free-with-context) :void
  (ptr :pointer) (line :int) (file :string) (func :string))
(defcfun ("al_realloc_with_context" realloc-with-context) :pointer
  (ptr :pointer) (n :uint) (line :int) (file :string) (func :string))
(defcfun ("al_calloc_with_context" calloc-with-context) :pointer
  (count :uint) (n :uint) (line :int) (file :string) (func :string))
(defcfun ("al_set_memory_interface" set-memory-interface) :void
  (memory-interface (:pointer (:struct memory-interface))))
