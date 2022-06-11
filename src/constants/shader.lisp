(in-package #:cl-liballegro)

(defcenum shader-type
  (:vertex 1)
  (:pixel 2))
(defcenum shader-platform
  :auto
  :glsl
  :hlsl
  :auto-minimal
  :glsl-minimal
  :hlsl-minimal
  :hlsl-sm-3-0)
