(in-package #:cl-liballegro)

;;; Graphics
;; Colors
(defcfun ("al_map_rgb" map-rgb) (:struct color)
  (r :uchar) (g :uchar) (b :uchar))
(defcfun ("al_map_rgb_f" map-rgb-f) (:struct color)
  (r c-float) (g c-float) (b c-float))
(defcfun ("al_map_rgba" map-rgba) (:struct color)
  (r :uchar) (g :uchar) (b :uchar) (a :uchar))
(defcfun ("al_premul_rgba" premul-rgba) (:struct color)
  (r :uchar) (g :uchar) (b :uchar) (a :uchar))
(defcfun ("al_map_rgba_f" map-rgba-f) (:struct color)
  (r c-float) (g c-float) (b c-float) (a c-float))
(defcfun ("al_premul_rgba_f" premul-rgba-f) (:struct color)
  (r :uchar) (g :uchar) (b :uchar) (a :uchar))
(defcfun ("al_unmap_rgb" unmap-rgb) :void
  (color (:struct color))
  (r (:pointer :uchar)) (g (:pointer :uchar)) (b (:pointer :uchar)) (a (:pointer :uchar)))
(defcfun ("al_unmap_rgb_f" unmap-rgb-f) :void
  (color (:struct color))
  (r (:pointer :float)) (g (:pointer :float)) (b (:pointer :float)))
(defcfun ("al_unmap_rgba" unmap-rgba) :void
  (color (:struct color))
  (r (:pointer :uchar)) (g (:pointer :uchar)) (b (:pointer :uchar)) (a (:pointer :uchar)))
(defcfun ("al_unmap_rgba_f" unmap-rgba-f) :void
  (color (:struct color))
  (r (:pointer :float)) (g (:pointer :float)) (b (:pointer :float)))

;; Locking and pixel formats
(defcfun ("al_get_pixel_size" get-pixel-size) :int (format pixel-format))
(defcfun ("al_get_pixel_format_bits" get-pixel-format-bits) :int
  (format pixel-format))
(defcfun ("al_get_pixel_block_size" get-pixel-block-size) :int (format pixel-format))
(defcfun ("al_get_pixel_block_width" get-pixel-block-width) :int (format pixel-format))
(defcfun ("al_get_pixel_block_height" get-pixel-block-height) :int (format pixel-format))
(defcfun ("al_lock_bitmap" lock-bitmap) :pointer
  (bitmap :pointer) (format pixel-format) (flags locking-flags))
(defcfun ("al_lock_bitmap_region" lock-bitmap-region) :pointer
  (bitmap :pointer) (x :int) (y :int) (width :int) (height :int)
  (format pixel-format) (flags locking-flags))
(defcfun ("al_unlock_bitmap" unlock-bitmap) :void (bitmap :pointer))
(defcfun ("al_lock_bitmap_blocked" lock-bitmap-blocked) :pointer
  (bitmap :pointer) (flags locking-flags))
(defcfun ("al_lock_bitmap_region_blocked" lock-bitmap-region-blocked) :pointer
  (bitmap :pointer) (x-block :int) (y-block :int) (width-block :int) (height-block :int)
  (flags locking-flags))

;; Bitmap Creation
(defcfun ("al_create_bitmap" create-bitmap) :pointer (w :int) (h :int))
(defcfun ("al_create_sub_bitmap" create-sub-bitmap) :pointer
  (parent :pointer) (x :int) (y :int) (w :int) (h :int))
(defcfun ("al_clone_bitmap" clone-bitmap) :pointer (bitmap :pointer))
(defcfun ("al_convert_bitmap" convert-bitmap) :void (bitmap :pointer))
(defcfun ("al_convert_memory_bitmaps" convert-memory-bitmaps) :void)
(defcfun ("al_destroy_bitmap" destroy-bitmap) :void (bitmap :pointer))
(defcfun ("al_get_new_bitmap_flags" get-new-bitmap-flags) bitmap-flags)
(defcfun ("al_get_new_bitmap_format" get-new-bitmap-format) pixel-format)
(defcfun ("al_set_new_bitmap_flags" set-new-bitmap-flags) :void (flags bitmap-flags))
(defcfun ("al_add_new_bitmap_flag" add-new-bitmap-flag) :void (flag bitmap-flags))
(defcfun ("al_set_new_bitmap_format" set-new-bitmap-format) :void
  (pixel-format pixel-format))
(defcfun ("al_set_new_bitmap_depth" set-new-bitmap-depth) :void (depth :int))
(defcfun ("al_get_new_bitmap_depth" get-new-bitmap-depth) :int)
(defcfun ("al_set_new_bitmap_samples" set-new-bitmap-samples) :void (samples :int))
(defcfun ("al_get_new_bitmap_samples" get-new-bitmap-samples) :int)
(defcfun ("al_set_new_bitmap_wrap" set-new-bitmap-wrap) :void (u bitmap-wrap) (v bitmap-wrap))
(defcfun ("al_get_new_bitmap_wrap" get-new-bitmap-wrap) :void (u :pointer) (v :pointer))

;; Bitmap properties
(defcfun ("al_get_bitmap_flags" get-bitmap-flags) bitmap-flags (bitmap :pointer))
(defcfun ("al_get_bitmap_format" get-bitmap-format) pixel-format (bitmap :pointer))
(defcfun ("al_get_bitmap_height" get-bitmap-height) :int (bitmap :pointer))
(defcfun ("al_get_bitmap_width" get-bitmap-width) :int (bitmap :pointer))
(defcfun ("al_is_bitmap_locked" is-bitmap-locked) :boolean (bitmap :pointer))
(defcfun ("al_get_pixel" get-pixel) (:struct color) (bitmap :pointer) (x c-int) (y c-int))
(defcfun ("al_is_compatible_bitmap" is-compatible-bitmap) :boolean (bitmap :pointer))
(defcfun ("al_is_sub_bitmap" is-sub-bitmap) :boolean (bitmap :pointer))
(defcfun ("al_get_parent_bitmap" get-parent-bitmap) :pointer (bitmap :pointer))
(defcfun ("al_get_bitmap_x" get-bitmap-x) :int (bitmap :pointer))
(defcfun ("al_get_bitmap_y" get-bitmap-y) :int (bitmap :pointer))
(defcfun ("al_reparent_bitmap" reparent-bitmap) :void
  (bitmap :pointer) (parent :pointer) (x c-int) (y c-int) (w c-int) (h c-int))

;; Drawing Operations
(defcfun ("al_clear_to_color" clear-to-color) :void (color (:struct color)))
(defcfun ("al_clear_depth_buffer" clear-depth-buffer) :void (z c-float))
(defcfun ("al_draw_bitmap" draw-bitmap) :void
  (bitmap :pointer) (dx c-float) (dy c-float) (flags draw-flags))
(defcfun ("al_draw_tinted_bitmap" draw-tinted-bitmap) :void
  (bitmap :pointer)
  (color (:struct color))
  (dx c-float) (dy c-float)
  (flags draw-flags))
(defcfun ("al_draw_bitmap_region" draw-bitmap-region) :void
  (bitmap :pointer)
  (sx c-float) (sy c-float) (sw c-float) (sh c-float) (dx c-float) (dy c-float)
  (flags draw-flags))
(defcfun ("al_draw_tinted_bitmap_region" draw-tinted-bitmap-region) :void
  (bitmap :pointer)
  (color (:struct color))
  (sx c-float) (sy c-float) (sw c-float) (sh c-float) (dx c-float) (dy c-float)
  (flags draw-flags))
(defcfun ("al_draw_pixel" draw-pixel) :void
  (x c-float) (y c-float)
  (color (:struct color)))
(defcfun ("al_draw_rotated_bitmap" draw-rotated-bitmap) :void
  (bitmap :pointer)
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (angle c-float)
  (flags draw-flags))
(defcfun ("al_draw_tinted_rotated_bitmap" draw-tinted-rotated-bitmap) :void
  (bitmap :pointer)
  (color (:struct color))
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (angle c-float)
  (flags draw-flags))
(defcfun ("al_draw_scaled_rotated_bitmap" draw-scaled-rotated-bitmap) :void
  (bitmap :pointer)
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (xscale c-float) (yscale c-float)
  (angle c-float)
  (flags draw-flags))
(defcfun ("al_draw_tinted_scaled_rotated_bitmap" draw-tinted-scaled-rotated-bitmap)
    :void
  (bitmap :pointer)
  (color (:struct color))
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (xscale c-float) (yscale c-float)
  (angle c-float)
  (flags draw-flags))
(defcfun ("al_draw_tinted_scaled_rotated_bitmap_region"
          draw-tinted-scaled-rotated-bitmap-region) :void
  (bitmap :pointer)
  (sx c-float) (sy c-float) (sw c-float) (sh c-float)
  (color (:struct color))
  (cx c-float) (cy c-float)
  (dx c-float) (dy c-float)
  (xscale c-float) (yscale c-float)
  (angle c-float)
  (flags draw-flags))
(defcfun ("al_draw_scaled_bitmap" draw-scaled-bitmap) :void
  (bitmap :pointer)
  (sx c-float) (sy c-float) (sw c-float) (sh c-float)
  (dx c-float) (dy c-float) (dw c-float) (dh c-float)
  (flags draw-flags))
(defcfun ("al_draw_tinted_scaled_bitmap" draw-tinted-scaled-bitmap) :void
  (bitmap :pointer)
  (color (:struct color))
  (sx c-float) (sy c-float) (sw c-float) (sh c-float)
  (dx c-float) (dy c-float) (dw c-float) (dh c-float)
  (flags draw-flags))
(defcfun ("al_get_target_bitmap" get-target-bitmap) :pointer)
(defcfun ("al_put_pixel" put-pixel) :void
  (x :int) (y :int)
  (color (:struct color)))
(defcfun ("al_put_blended_pixel" put-blended-pixel) :void
  (x :int) (y :int)
  (color (:struct color)))
(defcfun ("al_set_target_bitmap" set-target-bitmap) :void (bitmap :pointer))
(defcfun ("al_set_target_backbuffer" set-target-backbuffer) :void (display :pointer))
(defcfun ("al_get_current_display" get-current-display) :pointer)

;; Blending modes
(defcfun ("al_get_blender" get-blender) :void
  (op :pointer) (src :pointer) (dst :pointer))
(defcfun ("al_get_separate_blender" get-separate-blender) :void
  (op :pointer) (src :pointer) (dst :pointer)
  (alpha-op :pointer) (alpha-src :pointer) (alpha-dst :pointer))
(defcfun ("al_get_blend_color" get-blend-color) (:struct color))
(defcfun ("al_set_blend_color" set-blend-color) :void (color (:struct color)))
(defcfun ("al_set_blender" set-blender) :void
  (op :int) (src :int) (dst :int))
(defcfun ("al_set_separate_blender" set-separate-blender) :void
  (op :int) (src :int) (dst :int)
  (alpha-op :int) (alpha-src :int) (alpha-dst :int))

;; Clipping
(defcfun ("al_get_clipping_rectangle" get-clipping-rectangle) :void
  (x :pointer) (y :pointer) (w :pointer) (h :pointer))
(defcfun ("al_set_clipping_rectangle" set-clipping-rectangle) :void
  (x :int) (y :int) (w :int) (h :int))
(defcfun ("al_reset_clipping_rectangle" reset-clipping-rectangle) :void)

;; Graphics utility functions
(defcfun ("al_convert_mask_to_alpha" convert-mask-to-alpha) :void
  (bitmap :pointer) (color (:struct color)))

;; Deferred drawing
(defcfun ("al_hold_bitmap_drawing" hold-bitmap-drawing) :void (hold :boolean))
(defcfun ("al_is_bitmap_drawing_held" is-bitmap-drawing-held) :boolean)

;; Images I/O
(defcfun ("al_register_bitmap_loader" register-bitmap-loader) :boolean
  (extension :string) (loader :pointer))
(defcfun ("al_register_bitmap_saver" register-bitmap-saver) :boolean
  (extension :string) (saver :boolean))
(defcfun ("al_register_bitmap_loader_f" register-bitmap-loader-f) :boolean
  (extension :string) (loader-f :pointer))
(defcfun ("al_register_bitmap_saver_f" register-bitmap-saver-f) :boolean
  (extension :string) (loader-f :pointer))
(defcfun ("al_load_bitmap" load-bitmap) :pointer (filename :string))
(defcfun ("al_load_bitmap_flags" load-bitmap-flags) :pointer
  (filename :string) (flags bitmap-loader-flags))
(defcfun ("al_load_bitmap_f" load-bitmap-f) :pointer (fp :pointer) (ident :string))
(defcfun ("al_load_bitmap_flags_f" load-bitmap-flags-f) :pointer
  (fp :pointer) (ident :string) (flags bitmap-loader-flags))
(defcfun ("al_save_bitmap" save-bitmap) :boolean
  (filename :string) (bitmap :pointer))
(defcfun ("al_save_bitmap_f" save-bitmap-f) :boolean
  (fp :pointer) (ident :string) (bitmap :pointer))
(defcfun ("al_register_bitmap_identifier" register-bitmap-identifier) :bool
  (extension :string) (identifier :bool))
(defcfun ("al_identify_bitmap" identify-bitmap) :string (filename :string))
(defcfun ("al_identify_bitmap_f" identify-bitmap-f) :string (fp :string))

;; Render State
(defcfun ("al_set_render_state" set-render-state) :void
  (state render-state) (value c-int))
