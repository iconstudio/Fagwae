/// @function script_callback_toggle_sfx
/// @description script_callback_toggle_sfx()
function script_callback_toggle_sfx() {
	if global.setting_sfx == 0
		global.setting_sfx = 7
	else
		global.setting_sfx = 0

	profile_volumes()
	image_index = 1 - image_index



}
