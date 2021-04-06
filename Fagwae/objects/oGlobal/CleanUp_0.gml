/// @description Clean memory up
application_surface_draw_enable(true)

if surface_exists(surf)
	surface_free(surf)
if sprite_exists(capture)
	sprite_delete(capture)
