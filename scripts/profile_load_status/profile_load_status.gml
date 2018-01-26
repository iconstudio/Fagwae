/// @description profile_load_status(data)
/// @function profile_load_status
/// @param data { buffer }

global.status_name = buffer_read(argument0, buffer_string)
global.status_id = buffer_read(argument0, buffer_string)
global.status_dead = buffer_read(argument0, buffer_u32)
global.status_tutorial = buffer_read(argument0, buffer_bool)
global.status_goneextreme = buffer_read(argument0, buffer_bool)
global.status_doneextreme = buffer_read(argument0, buffer_bool)

return true
