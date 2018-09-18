/// @function script_callback_volume_music(id, value)
/// @description 음악의 음량을 조절합니다.
/// @param id
/// @param value

global.setting_music = floor(argument[1])
profile_volumes()
