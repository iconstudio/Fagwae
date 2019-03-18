/// @description profile_read(data)
/// @function profile_read
/// @param data { buffer }
var size = buffer_get_size(argument0)
if size < 12 {
	show_debug_message("The file is too small.")
	return false
}

if buffer_read(argument0, buffer_u16) != file_header {
	show_debug_message("The file's header is invaild.")
	return false
}

if buffer_read(argument0, buffer_string) != GM_version {
	show_debug_message("The file's version is not acceptable.")
	return false
}

profile_read_option(argument0)
profile_read_status(argument0)
profile_read_log0(argument0)	
profile_read_log1(argument0)	

return true
