/// @description profile_load_begin(data)
/// @function profile_load_begin
/// @param data { buffer }

var size = buffer_get_size(argument0)
if size < 8
	return false

if buffer_read(argument0, buffer_u16) != file_header
	return false

if buffer_read(argument0, buffer_string) != GM_version
	return false

while true {
	var chunk = string(buffer_read(argument0, buffer_string))
	var size = buffer_read(argument0, buffer_u32)
	var position = buffer_tell(argument0)

	if chunk == "X"
		break
	else if chunk == "O0"
		profile_load_option(argument0)
	else if chunk == "S0"
		profile_load_status(argument0)
	else if chunk == "L0"
		profile_load_log0(argument0)	
	else if chunk == "L1"
		profile_load_log1(argument0)	

	buffer_seek(argument0, buffer_seek_start, size + position)
}

return true
