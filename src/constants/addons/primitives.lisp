(in-package #:cl-liballegro)

(defcenum prim-type
  line-list
  line-strip
  line-loop
  triangle-list
  triangle-strip
  triangle-fan
  point-list
  num-types)

(defcenum prim-storage
  float-2
  float-3
  short-2
  float-1
  float-4
  ubyte-4
  short-4
  normalized-ubyte-4
  normalized-short-2
  normalized-short-4
  normalized-ushort-2
  normalized-ushort-4
  half-float-2
  half-float-4)

(defcenum line-join
  none
  bevel
  round-line ;; round (symbol collision)
  (miter 3)
  (mitre 3))

(defcenum line-cap
  none
  square
  round-cap ;; round (symbol collision)
  triangle
  closed)

(defbitfield buffer-flags
  (stream-buffer #x01) ;; stream (symbol collision)
  (static #x02)
  (dynamic #x04)
  (readwrite #x08))
