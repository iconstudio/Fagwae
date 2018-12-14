/// @description Clean memory up

ds_list_destroy(notification_list)
ds_list_destroy(ui_listchecker)
ds_list_destroy(global.ui_listbox)

if surface_exists(surf)
	surface_free(surf)
if sprite_exists(capture)
	sprite_delete(capture)

profile_save(global.profilefile)

if gamepad_index != -1
	gamepad_set_vibration(gamepad_index, 0, 0)
