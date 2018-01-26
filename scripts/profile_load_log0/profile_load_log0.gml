/// @description profile_load_log0(data)
/// @function profile_load_log0
/// @param data { buffer }

global.log_opennormal = buffer_read(argument0, buffer_u16)
global.log_openextreme = buffer_read(argument0, buffer_u16)
global.log_highscore_1 = buffer_read(argument0, buffer_u64)
global.log_highscore_2 = buffer_read(argument0, buffer_u64)

return true
