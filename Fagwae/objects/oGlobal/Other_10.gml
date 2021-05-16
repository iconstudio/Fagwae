/// @description Creating a surface
surf = surface_create(room_width, room_height)
global.application_texture = surface_get_texture(surf)
global.surface_w = texture_get_width(global.application_texture)
global.surface_h = texture_get_height(global.application_texture)


surface_set_target(surf)
draw_clear_alpha(0, 0)
surface_reset_target()
