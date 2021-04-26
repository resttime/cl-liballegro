(in-package #:cl-liballegro)

;;; UTF-8

;; Creating and destroying strings
(defcfun ("al_ustr_new" ustr-new) (:pointer (:struct ustr)) (s :string))
(defcfun ("al_ustr_new_from_buffer" ustr-new-from-buffer) (:pointer (:struct ustr)) (s :string) (size :uint))
(defcfun ("al_ustr_newf" ustr-newf) (:pointer (:struct ustr)) (fmt :string) &rest)
(defcfun ("al_ustr_free" ustr-free) :void (us (:pointer (:struct ustr))))
(defcfun ("al_cstr" cstr) :string (us (:pointer (:struct ustr))))
(defcfun ("al_ustr_to_buffer" ustr_to_buffer) :void (us (:pointer (:struct ustr))) (buffer :string) (size :int))
(defcfun ("al_cstr_dup" cstr_dup) :string (us (:pointer (:struct ustr))))
(defcfun ("al_ustr_dup" ustr_dup) (:pointer (:struct ustr)) (us (:pointer (:struct ustr))))
(defcfun ("al_ustr_dup_substr" ustr_dup_substr) (:pointer (:struct ustr)) (us (:pointer (:struct ustr))) (start-pos :int) (end-pos :int))

;; Predefined strings
(defcfun ("al_ustr_empty_string" ustr_empty_string) (:pointer (:struct ustr)))

;; Creating strings by referencing other data
(defcfun ("al_ref_cstr" ref_cstr) (:pointer (:struct ustr)) (info (:pointer (:struct ustr-info))) (s :string))
(defcfun ("al_ref_buffer" ref_buffer) (:pointer (:struct ustr)) (info (:pointer (:struct ustr-info))) (s :string) (size :uint))
(defcfun ("al_ref_ustr" ref_ustr) (:pointer (:struct ustr)) (info (:pointer (:struct ustr-info))) (us :pointer) (start-pos :int) (end-pos :int))

;; Sizes and offsets
(defcfun ("al_ustr_size" ustr_size) :uint (us (:pointer (:struct ustr))))
(defcfun ("al_ustr_length" ustr_length) :uint (us (:pointer (:struct ustr))))
(defcfun ("al_ustr_offset" ustr_offset) :int (us (:pointer (:struct ustr))) (index :int))
(defcfun ("al_ustr_next" ustr_next) :bool (us (:pointer (:struct ustr))) (pos (:pointer :int)))
(defcfun ("al_ustr_prev" ustr_prev) :bool (us (:pointer (:struct ustr))) (pos (:pointer :int)))

;; Getting code points
(defcfun ("al_ustr_get" ustr_get) :int32 (ub (:pointer (:struct ustr))) (pos :int))
(defcfun ("al_ustr_get_next" ustr_get_next) :int32 (us (:pointer (:struct ustr))) (pos (:pointer :int)))
(defcfun ("al_ustr_prev_get" ustr_prev_get) :int32 (us (:pointer (:struct ustr))) (pos (:pointer :int)))

;; Inserting into strings
(defcfun ("al_ustr_insert" ustr_insert) :bool (us1 (:pointer (:struct ustr))) (pos :int) (us2 (:pointer (:struct ustr))))
(defcfun ("al_ustr_insert_cstr" ustr_insert_cstr) :bool (us (:pointer (:struct ustr))) (pos :int) (us2 :string))
(defcfun ("al_ustr_insert_chr" ustr_insert_chr) :uint (us (:pointer (:struct ustr))) (pos :int) (c :int32))

;; Appending to strings
(defcfun ("al_ustr_append" ustr_append) :bool (us1 (:pointer (:struct ustr))) (us2 (:pointer (:struct ustr))))
(defcfun ("al_ustr_append_cstr" ustr_append_cstr) :bool (us (:pointer (:struct ustr))) (s :string))
(defcfun ("al_ustr_append_chr" ustr_append_chr) :uint (us (:pointer (:struct ustr))) (c :int32))
(defcfun ("al_ustr_appendf" ustr_appendf) :bool
  (us (:pointer (:struct ustr))) (fmt :string) &rest)
;; The ap function parameter is type va_list?
;; (defcfun ("al_ustr_vappendf" ustr_vappendf) :bool
;;   (us (:pointer (:struct ustr))) (fmt :string) (ap (:struct va-list)))

;; Removing parts of strings
(defcfun ("al_ustr_remove_chr" ustr_remove_chr) :bool (us (:pointer (:struct ustr))) (pos :int))
(defcfun ("al_ustr_remove_range" ustr_remove_range) :bool (us (:pointer (:struct ustr))) (start-pos :int) (end-pos :int))
(defcfun ("al_ustr_truncate" ustr_truncate) :bool (us (:pointer (:struct ustr))) (start-pos :int))
(defcfun ("al_ustr_ltrim_ws" ustr_ltrim_ws) :bool (us (:pointer (:struct ustr))))
(defcfun ("al_ustr_rtrim_ws" ustr_rtrim_ws) :bool (us (:pointer (:struct ustr))))
(defcfun ("al_ustr_trim_ws" ustr_trim_ws) :bool (us (:pointer (:struct ustr))))

;; Assigning one string to another
(defcfun ("al_ustr_assign" ustr_assign) :bool
  (us1 (:pointer (:struct ustr))) (us2 (:pointer (:struct ustr))))
(defcfun ("al_ustr_assign_substr" ustr_assign_substr) :bool
  (us1 (:pointer (:struct ustr))) (us2 (:pointer (:struct ustr))) (start-pos :int) (end-pos :int))
(defcfun ("al_ustr_assign_cstr" ustr_assign_cstr) :bool (us1 (:pointer (:struct ustr))) (s :string))

;; Replacing parts of string
(defcfun ("al_ustr_set_chr" ustr_set_chr) :uint
  (us (:pointer (:struct ustr))) (start-pos :int) (c :int32))
(defcfun ("al_ustr_replace_range" ustr_replace_range) :bool
  (us1 (:pointer (:struct ustr)))
  (start-pos1 :int)
  (end-pos1 :int)
  (us2 (:pointer (:struct ustr))))

;; Searching
(defcfun ("al_ustr_find_chr" ustr_find_chr) :int
  (us (:pointer (:struct ustr))) (start-pos :int) (c :int32))
(defcfun ("al_ustr_rfind_chr" ustr_rfind_chr) :int
  (us (:pointer (:struct ustr))) (end-pos :int) (c :int32))
(defcfun ("al_ustr_find_set" ustr_find_set) :int
  (us (:pointer (:struct ustr))) (start-pos :int) (accept (:pointer (:struct ustr))))
(defcfun ("al_ustr_find_set_cstr" ustr_find_set_cstr) :int
  (us (:pointer (:struct ustr))) (start-pos :int) (accept :string))
(defcfun ("al_ustr_find_cset" ustr_find_cset) :int
  (us (:pointer (:struct ustr))) (start-pos :int) (accept (:pointer (:struct ustr))))
(defcfun ("al_ustr_find_cset_cstr" ustr_find_cset_cstr) :int
  (us (:pointer (:struct ustr))) (start-pos :int) (reject :string))
(defcfun ("al_ustr_find_str" ustr_find_str) :int
  (haystack (:pointer (:struct ustr)))
  (start-pos :int)
  (needle (:pointer (:struct ustr))))
(defcfun ("al_ustr_find_cstr" ustr_find_cstr) :int
  (haystack (:pointer (:struct ustr)))
  (start-pos :int)
  (needle :string))
(defcfun ("al_ustr_rfind_str" ustr_rfind_str) :int
  (haystack (:pointer (:struct ustr)))
  (end-pos :int)
  (needle (:pointer (:struct ustr))))
(defcfun ("al_ustr_rfind_cstr" ustr_rfind_cstr) :int
  (haystack (:pointer (:struct ustr)))
  (end-pos :int)
  (needle :string))
(defcfun ("al_ustr_find_replace" ustr_find_replace) :bool
  (us (:pointer (:struct ustr)))
  (start-pos :int)
  (find (:pointer (:struct ustr)))
  (replace (:pointer (:struct ustr))))
(defcfun ("al_ustr_find_replace_cstr" ustr_find_replace_cstr) :bool
  (us (:pointer (:struct ustr)))
  (start-pos :int)
  (find :string)
  (replace :string))

;; Comparing
(defcfun ("al_ustr_equal" ustr_equal) :bool (us1 (:pointer (:struct ustr))) (us2 (:pointer (:struct ustr))))
(defcfun ("al_ustr_compare" ustr_compare) :int (us1 (:pointer (:struct ustr))) (us2 (:pointer (:struct ustr))))
(defcfun ("al_ustr_ncompare" ustr_ncompare) :int (us1 (:pointer (:struct ustr))) (us2 (:pointer (:struct ustr))) (n :int))
(defcfun ("al_ustr_has_prefix" ustr_has_prefix) :bool (us1 (:pointer (:struct ustr))) (us2 (:pointer (:struct ustr))))
(defcfun ("al_ustr_has_prefix_cstr" ustr_has_prefix_cstr) :bool (us1 :string) (us2 :string))
(defcfun ("al_ustr_has_suffix" ustr_has_suffix) :bool (us1 (:pointer (:struct ustr))) (us2 (:pointer (:struct ustr))))
(defcfun ("al_ustr_has_suffix_cstr" ustr_has_suffix_cstr) :bool (us1 (:pointer (:struct ustr))) (us2 :string))

;; UTF-16 conversion
(defcfun ("al_ustr_new_from_utf16" ustr_new_from_utf16) (:pointer (:struct ustr)) (s (:pointer :uint16)))
(defcfun ("al_ustr_size_utf16" ustr_size_utf16) :uint (us (:pointer (:struct ustr))))
(defcfun ("al_ustr_encode_utf16" ustr_encode_utf16) :uint
  (us (:pointer (:struct ustr)))
  (s (:pointer :uint16))
  (n :uint))

;; Low-level UTF-8 routines
(defcfun ("al_utf8_width" utf8_width) :uint (c :int32))
(defcfun ("al_utf8_encode" utf8_encode) :uint (s (:pointer :uint8)) (c :int32))

;; Low-level UTF-16 routines
(defcfun ("al_utf16_width" utf16_width) :uint (c :int32))
(defcfun ("al_utf16_encode" utf16_encode) :uint (s (:pointer :uint16)) (c :int32))
