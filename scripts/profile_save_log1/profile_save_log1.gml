/// @description profile_save_log1(data)
/// @function profile_save_log1
/// @param data { buffer }

buffer_write(argument0, buffer_u16, global.achievement_count)
if global.achievement_count > 0 {
	for (var i = 0; i < global.achievement_count; ++i)
		buffer_write(argument0, buffer_s16, global.achievement[i])
}
