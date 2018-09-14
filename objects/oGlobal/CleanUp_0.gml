/// @description Clean memory up

ds_list_destroy(notification_list)

if surface_exists(surf)
	surface_free(surf)

if sprite_exists(capture)
	sprite_delete(capture)

profile_save(global.profilefile)
