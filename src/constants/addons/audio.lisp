(in-package :cl-liballegro)

;;; Audio addon
(defcenum audio-depth
  (:int8      #x00)
  (:int16     #x01)
  (:int24     #x02)
  (:float32   #x03)

  (:unsigned  #x08)

  (:uint8     #x08)
  (:uint16    #x09)
  (:uint24    #x0A))

(defconstant +audio-pan-none+ -1000.0)

(defcenum channel-conf
  (:1    #x10)
  (:2    #x20)
  (:3    #x30)
  (:4    #x40)
  (:5-1  #x51)
  (:6-1  #x61)
  (:7-1  #x71))

(defcenum mixer-quality
  (:point    #x110)
  (:linear   #x111)
  (:cubic    #x112))

(defcenum playmode
  (:once    #x100)
  (:loop    #x101)
  (:bidir   #x102)
  (:-stream-once    #x103)
  (:-stream-onedir  #x104))
