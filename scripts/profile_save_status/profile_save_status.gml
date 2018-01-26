/// @description profile_save_status(data)
/// @function profile_save_status
/// @param data { buffer }

// write data
buffer_write(argument0, buffer_string, global.status_name)
buffer_write(argument0, buffer_string, global.status_id)
buffer_write(argument0, buffer_u32, global.status_dead)
buffer_write(argument0, buffer_bool, global.status_tutorial)
