/// @description profile_save_option(data)
/// @function profile_save_option
/// @param data { buffer }

// write data
buffer_write(argument0, buffer_u8, global.setting_music)
buffer_write(argument0, buffer_u8, global.setting_sfx)
buffer_write(argument0, buffer_bool, global.setting_effect)
buffer_write(argument0, buffer_bool, global.setting_blur)
