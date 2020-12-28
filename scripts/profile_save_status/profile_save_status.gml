/// @description profile_save_status(data)
/// @function profile_save_status
/// @param data { buffer }
function profile_save_status(argument0) {

	// write data
	buffer_write(argument0, buffer_string, global.status_name)
	buffer_write(argument0, buffer_string, global.status_id)
	buffer_write(argument0, buffer_bool, global.status_tutorial)
	buffer_write(argument0, buffer_bool, global.status_goneextreme)
	buffer_write(argument0, buffer_bool, global.status_doneextreme)



}
