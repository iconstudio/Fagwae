/// @description Drawing application surface to screen

surface_set_target(surf)
draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
surface_reset_target()
