/// @function script_callback_volume_music
/// @description script_callback_volume_music(id, value)
/// @param id
/// @param value
global.setting_music = floor(argument[1])
profile_volumes()
