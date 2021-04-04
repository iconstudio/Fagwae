/// @function script_callback_volume_sfx
/// @description script_callback_volume_sfx(id, value)
/// @param id
/// @param value
function script_callback_volume_sfx() {
	global.setting_sfx = floor(argument[1])
	profile_volumes()



}
