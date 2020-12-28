/// @description profile_save_log1(data)
/// @function profile_save_log1
/// @param data { buffer }
function profile_save_log1(argument0) {
	buffer_write(argument0, buffer_u16, global.achievement_count)
	if 0 < global.achievement_count {
		for (var i = 0; i < global.achievement_count; ++i) {
			buffer_write(argument0, buffer_s16, global.achievement[i])
			buffer_write(argument0, buffer_bool, global.achievement_cleared[i])
		}
	}



}
