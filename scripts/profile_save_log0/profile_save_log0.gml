/// @description profile_save_log0(data)
/// @function profile_save_log0
/// @param data { buffer }

// write data
buffer_write(argument0, buffer_u16, global.log_opennormal)
buffer_write(argument0, buffer_u16, global.log_openextreme)
buffer_write(argument0, buffer_u64, global.log_highscore_1)
buffer_write(argument0, buffer_u64, global.log_highscore_2)
