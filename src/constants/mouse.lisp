(in-package :cl-liballegro)

(defconstant +mouse-max-extra-axes+ 4
  "Allow up to four extra axes for future expansion.")

(defcenum mouse-button
  (:left 1)
  (:right 2)
  (:middle 3))

;; Mouse cursors
(defcenum system-mouse-cursor
  (:none         0)
  (:default      1)
  (:arrow        2)
  (:busy         3)
  (:question     4)
  (:edit         5)
  (:move         6)
  (:resize-n     7)
  (:resize-w     8)
  (:resize-s     9)
  (:resize-e    10)
  (:resize-nw   11)
  (:resize-sw   12)
  (:resize-se   13)
  (:resize-ne   14)
  (:progress    15)
  (:precision   16)
  (:link        17)
  (:alt-select  18)
  (:unavailable 19)
  :num-system-mouse-cursors)
