#include "allegro5/allegro.h"

#define return_color_ptr \
    ALLEGRO_COLOR *color_ptr = (ALLEGRO_COLOR *)malloc(sizeof(ALLEGRO_COLOR)); \
	color_ptr->r = color.r; \
	color_ptr->g = color.g; \
	color_ptr->b = color.b; \
	color_ptr->a = color.a; \
	return color_ptr; 
	
////Graphics
///Colors
//ALLEGRO_COLOR al_map_rgb(unsigned char r, unsigned char g, unsigned char b);
//ALLEGRO_COLOR al_map_rgb_f(float r, float g, float b);
//ALLEGRO_COLOR al_map_rgba(unsigned char r, unsigned char g, unsigned char b, unsigned char a);
//ALLEGRO_COLOR al_map_rgba_f(float r, float g, float b, float a);
ALLEGRO_COLOR *lisp_al_map_rgb(unsigned char r, unsigned char g, unsigned char b);
ALLEGRO_COLOR *lisp_al_map_rgb_f(float r, float g, float b);
ALLEGRO_COLOR *lisp_al_map_rgba(unsigned char r, unsigned char g, unsigned char b, 
                                unsigned char a);
ALLEGRO_COLOR *lisp_al_map_rgba_f(float r, float g, float b, float a);

///Bitmap properties
//ALLEGRO_COLOR al_get_pixel(ALLEGRO_BITMAP *bitmap, int x, int y);
ALLEGRO_COLOR *lisp_al_get_pixel(ALLEGRO_BITMAP *bitmap, int x, int y);