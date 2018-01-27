/// @description Create a surface

surf = surface_create(view_width, view_height)
global.surface_tex = surface_get_texture(surf)
global.surface_w = texture_get_width(global.surface_tex)
global.surface_h = texture_get_height(global.surface_tex)

surface_set_target(surf)
draw_clear_alpha(0, 0)
surface_reset_target()
