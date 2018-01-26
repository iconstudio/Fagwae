/// @description profile_load_option(data)
/// @function profile_load_option
/// @param data { buffer }

global.setting_music = buffer_read(argument0, buffer_u8)
global.setting_sfx = buffer_read(argument0, buffer_u8)
global.setting_effect = buffer_read(argument0, buffer_bool)
global.setting_blur = buffer_read(argument0, buffer_bool)

return true
