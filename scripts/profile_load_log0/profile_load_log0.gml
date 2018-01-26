/// @description profile_load_log0(data)
/// @function profile_load_log0
/// @param data { buffer }

global.log_openshape = buffer_read(argument0, buffer_u16)
global.log_openframe = buffer_read(argument0, buffer_u16)
global.log_openindet = buffer_read(argument0, buffer_u16)
global.log_highscore_1 = buffer_read(argument0, buffer_u64)
global.log_highscore_2 = buffer_read(argument0, buffer_u64)

return true
