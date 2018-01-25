/// @description Create a surface

surf = surface_create(view_wport, view_hport)
stex = surface_get_texture(surf)
swid = texture_get_width(stex)
shei = texture_get_height(stex)

surface_set_target(surf)
draw_clear_alpha(0, 0)
surface_reset_target()
