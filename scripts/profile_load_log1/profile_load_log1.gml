/// @description profile_load_log1(data)
/// @function profile_load_log1
/// @param data { buffer }

var count = buffer_read(argument0, buffer_u16)
for (var i = 0; i < count; ++i) {
	global.achievement[i] = buffer_read(argument0, buffer_s16)
}

if count > global.achievement_count {
	global.achievement_count = count
}

return true
