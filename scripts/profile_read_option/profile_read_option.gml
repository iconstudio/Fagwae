/// @function profile_read_option(data)
/// @description 프로필 중 옵션을 읽어옵니다.
/// @param data { buffer }

global.setting_music = buffer_read(argument0, buffer_u8)
global.setting_sfx = buffer_read(argument0, buffer_u8)
global.setting_effect = buffer_read(argument0, buffer_bool)
global.setting_fxaa = buffer_read(argument0, buffer_bool)

return true
