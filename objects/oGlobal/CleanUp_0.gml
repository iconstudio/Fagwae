/// @description Clean memory up

font_delete(global.font)
font_delete(global.fontborder)
ds_list_destroy(notification_list)

if surface_exists(surf)
	surface_free(surf)

profile_save(global.profilefile)
