#include "wrapper.h"

ALLEGRO_COLOR *lisp_al_map_rgb(unsigned char r, unsigned char g, unsigned char b)
{   
	ALLEGRO_COLOR color = al_map_rgb(r, g, b);
	return_color_ptr;
}

ALLEGRO_COLOR *lisp_al_map_rgb_f(float r, float g, float b)
{   
	ALLEGRO_COLOR color = al_map_rgb_f(r, g, b);
    return_color_ptr;
}

ALLEGRO_COLOR *lisp_al_map_rgba(unsigned char r, unsigned char g, unsigned char b, 
                                unsigned char a)
{   
	ALLEGRO_COLOR color = al_map_rgba(r, g, b, a);
	return_color_ptr;
}

ALLEGRO_COLOR *lisp_al_map_rgba_f(float r, float g, float b, float a)
{   
	ALLEGRO_COLOR color = al_map_rgba_f(r, g, b, a);
	return_color_ptr;
}

ALLEGRO_COLOR *lisp_al_get_pixel(ALLEGRO_BITMAP *bitmap, int x, int y)
{
    ALLEGRO_COLOR color = al_get_pixel(bitmap, x, y);
	return_color_ptr;
}
