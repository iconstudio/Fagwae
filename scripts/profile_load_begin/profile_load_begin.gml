/// @description profile_load_begin(data)
/// @function profile_load_begin
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

profile_load_option(argument0)
profile_load_status(argument0)
profile_load_log0(argument0)	
profile_load_log1(argument0)	

return true
