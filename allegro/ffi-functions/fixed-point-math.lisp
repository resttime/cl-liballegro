(in-package #:cl-liballegro)

;;; Fixed point math
(defcfun ("al_itofix" itofix) fixed (x :int))
(defcfun ("al_fixtoi" fixtoi) :int (x fixed))
(defcfun ("al_fixfloor" fixfloor) :int (x fixed))
(defcfun ("al_fixceil" fixceil) :int (x fixed))
(defcfun ("al_ftofix" ftofix) fixed (x c-double))
(defcfun ("al_fixtof" fixtof) c-double (x fixed))
(defcfun ("al_fixmul" fixmul) fixed (x fixed) (y fixed))
(defcfun ("al_fixdiv" fixdiv) fixed (x fixed) (y fixed))
(defcfun ("al_fixadd" fixadd) fixed (x fixed) (y fixed))
(defcfun ("al_fixsub" fixsub) fixed (x fixed) (y fixed))

;; Fixed point trig
(defcfun ("al_fixsin" fixsin) fixed (x fixed))
(defcfun ("al_fixcos" fixcos) fixed (x fixed))
(defcfun ("al_fixtan" fixtan) fixed (x fixed))
(defcfun ("al_fixasin" fixasin) fixed (x fixed))
(defcfun ("al_fixacos" fixacos) fixed (x fixed))
(defcfun ("al_fixatan" fixatan) fixed (x fixed))
(defcfun ("al_fixatan2" fixatan2) fixed (y fixed) (x fixed))
(defcfun ("al_fixsqrt" fixsqrt) fixed (x fixed))
(defcfun ("al_fixhypot" fixhypot) fixed (x fixed) (y fixed))
