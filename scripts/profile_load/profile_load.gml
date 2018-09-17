/// @function profile_load(file)
/// @description 프로필을 불러옵니다.
/// @param file { string }

if !file_exists(argument0) {
	show_debug_message("Cannot find buffer file.")
	return false
}

var buffer = buffer_load(argument0)
if !buffer_exists(buffer) {
	show_debug_message("Cannot buffer in the file.")
	return false
}

var result = profile_read(buffer)

buffer_delete(buffer)

return result
