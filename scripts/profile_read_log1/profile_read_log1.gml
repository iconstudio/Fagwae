/// @function profile_read_log1(data)
/// @description 프로필 중 도전과제를 읽어옵니다.
/// @param data { buffer }
function profile_read_log1(argument0) {
	var count = buffer_read(argument0, buffer_u16)
	if 0 < count {
		for (var i = 0; i < count; ++i) {
			global.achievement[i] = buffer_read(argument0, buffer_s16)
			global.achievement_cleared[i] = buffer_read(argument0, buffer_bool)
		}
	}

	return true



}
