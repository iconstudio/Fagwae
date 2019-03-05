/// @function script_callback_toggle_effect
/// @description script_callback_toggle_effect()
if global.setting_effect == 0
	global.setting_effect = 7
else
	global.setting_effect = 0

profile_volumes()
image_index = 1 - image_index
