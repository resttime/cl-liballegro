(in-package :cl-liballegro)

(defbitfield state-flags
  (:new-display-parameters  #x0001)
  (:new-bitmap-parameters   #x0002)
  (:display                 #x0004)
  (:target-bitmap           #x0008)
  (:blender                 #x0010)
  (:new-file-interface      #x0020)
  (:transform               #x0040)

  (:bitmap                  10)

  (:all                     #xffff))

