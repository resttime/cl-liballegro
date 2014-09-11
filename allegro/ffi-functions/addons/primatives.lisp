(in-package #:cl-liballegro)

;;; Primitives addon
;; General
(defcfun ("al_get_allegro_primitives_version" get-allegro-primitives-version)
    :uint32)
(defcfun ("al_init_primitives_addon" init-primitives-addon) :boolean)
(defcfun ("al_shutdown_primitives_addon" shutdown-primitives-addon) :boolean)

;; High level drawing routines
(defcfun ("al_draw_line" draw-line) :void 
  (x1 c-float) (y1 c-float) (x2 c-float) (y2 c-float)
  (color :pointer)
  (thickness c-float))
(defcfun ("al_draw_triangle" draw-triangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (x3 c-float) (y3 c-float)
  (color :pointer)
  (thickness c-float))
(defcfun ("al_draw_filled_triangle" draw-filled-triangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (x3 c-float) (y3 c-float)
  (color :pointer))
(defcfun ("al_draw_rectangle" draw-rectangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (color :pointer)
  (thickness c-float))
(defcfun ("al_draw_filled_rectangle" draw-filled-rectangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (color :pointer))
(defcfun ("al_draw_rounded_rectangle" draw-rounded-rectangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (rx c-float) (ry c-float) 
  (color :pointer)
  (thickness c-float))
(defcfun ("al_draw_filled_rounded_rectangle" draw-filled-rounded-rectangle) :void 
  (x1 c-float) (y1 c-float) 
  (x2 c-float) (y2 c-float) 
  (rx c-float) (ry c-float) 
  (color :pointer))
(defcfun ("al_calculate_arc" calculate-arc) :void
  (dest :pointer) (stride :int) 
  (cx c-float) (cy c-float)
  (rx c-float) (ry c-float)
  (start-theta c-float) (delta-theta c-float)
  (thickness c-float) (num-segments :int))
(defcfun ("al_draw_pieslice" draw-pieslice) :void 
  (cx c-float) (cy c-float) (radius c-float)
  (start-theta c-float) (delta-theta c-float)
  (color :pointer)
  (thickness c-float))
(defcfun ("al_draw_filled_pieslice" draw-filled-pieslice) :void 
  (cx c-float) (cy c-float) (radius c-float)
  (start-theta c-float) (delta-theta c-float)
  (color :pointer))
(defcfun ("al_draw_ellipse" draw-ellipse) :void
  (cx c-float) (cy c-float) (rx c-float) (ry c-float)
  (color :pointer)
  (thickness c-float))
(defcfun ("al_draw_filled_ellipse" draw-filled-ellipse) :void
  (cx c-float) (cy c-float) (rx c-float) (ry c-float)
  (color :pointer))
(defcfun ("al_draw_circle" draw-circle) :void
  (cx c-float) (cy c-float) (radius c-float)
  (color :pointer)
  (thickness c-float))
(defcfun ("al_draw_filled_circle" draw-filled-circle) :void
  (cx c-float) (cy c-float) (radius c-float)
  (color :pointer))
(defcfun ("al_draw_arc" draw-arc) :void 
  (cx c-float) (cy c-float) (radius c-float)
  (start-theta c-float) (delta-theta c-float)
  (color :pointer)
  (thickness c-float))
(defcfun ("al_draw_elliptical_arc" draw-elliptical-arc) :void 
  (cx c-float) (cy c-float) (rx c-float) (ry c-float)
  (start-theta c-float) (delta-theta c-float)
  (color :pointer)
  (thickness c-float))
(defcfun ("al_calculate_spline" calculate-spline) :void
  (dest :pointer) (stride :int) (points :pointer)
  (thickness c-float) (num-segments :int))
(defcfun ("al_draw_spline" draw-spline) :void
  (points :pointer)
  (color :pointer)
  (thickness c-float))
(defcfun ("al_calculate_ribbon" calculate-ribbon) :void
  (dest :pointer) (dest-stride :int) 
  (points :pointer) (points-stride :int)
  (thickness c-float) (num-segments :int))
(defcfun ("al_draw_ribbon" draw-ribbon) :void
  (points :pointer) (points-stride :int)
  (color :pointer)
  (thickness c-float) (num-segments :int))

;; Low level drawing routines
(defcfun ("al_draw_prim" draw-prim) :int 
  (vtxs :pointer) (decl :pointer) (texture :pointer)
  (start :int) (end :int) (type :int))
(defcfun ("al_draw_indexed_prim" draw-indexed-prim) :int 
  (vtxs :pointer) (decl :pointer) (texture :pointer)
  (indices :pointer) (num-vtx :int) (type :int))
(defcfun ("al_create_vertex_decl" create-vertex-decl) :pointer
  (elements :pointer) (stride :int))
(defcfun ("al_destroy_vertex_decl" destroy-vertex-decl) :void)
(defcfun ("al_draw_soft_triangle" draw-soft-triangle) :void
  (v1 :pointer) (v2 :pointer) (v3 :pointer) (state :pointer)
  (init :pointer) (first :pointer) (step :pointer) (draw :pointer))
(defcfun ("al_draw_soft_line" draw-soft-line) :void
  (v1 :pointer) (v2 :pointer) (state :pointer)
  (first :pointer) (step :pointer) (draw :pointer))
