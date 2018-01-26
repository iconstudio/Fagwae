/// @description profile_load(file)
/// @function profile_load
/// @param file { string }

global.achievement_count = 5
global.achievement_getter = []

if !file_exists(argument0) {
	show_debug_message("Cannot find buffer file.")
	return false
}

var buffer = buffer_load(argument0)
if !buffer_exists(buffer) {
	show_debug_message("Cannot buffer in the file.")
	return false
}

var result = profile_load_begin(buffer)

buffer_delete(buffer)

return result
