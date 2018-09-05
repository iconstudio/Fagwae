/// @description Clean memory up

ds_list_destroy(notification_list)

if surface_exists(surf)
	surface_free(surf)

if surface_exists(global.shared_surface)
	surface_free(global.shared_surface)

if sprite_exists(capture)
	sprite_delete(capture)

profile_save(global.profilefile)
