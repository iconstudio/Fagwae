/// @description profile_save(file)
/// @function profile_save
/// @param file { string }
function profile_save(argument0) {

	var buffer = buffer_create(1024, buffer_grow, 1)

	buffer_write(buffer, buffer_u16, file_header)
	buffer_write(buffer, buffer_string, GM_version)

	profile_save_option(buffer)
	profile_save_status(buffer)
	profile_save_log0(buffer)
	profile_save_log1(buffer)

	buffer_write(buffer, buffer_string, "XX")

	file_delete(argument0)
	buffer_save(buffer, argument0)
	buffer_delete(buffer)

	return true


}
