/// @function script_callback_volume_sfx(id, value)
/// @description 효과음의 음량을 조절합니다.
/// @param id
/// @param value

global.setting_sfx = floor(argument[1])
profile_volumes()
