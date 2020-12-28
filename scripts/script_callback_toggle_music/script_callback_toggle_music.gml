/// @function script_callback_toggle_music
/// @description script_callback_toggle_music()
function script_callback_toggle_music() {
	if global.setting_music == 0
		global.setting_music = 7
	else
		global.setting_music = 0

	profile_volumes()
	image_index = 1 - image_index



}
