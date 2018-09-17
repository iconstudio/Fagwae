/// @description profile_save_log0(data)
/// @function profile_save_log0
/// @param data { buffer }

// write data
buffer_write(argument0, buffer_u64, global.log_time_total)
buffer_write(argument0, buffer_u64, global.log_deads)
buffer_write(argument0, buffer_u8, global.log_stage_progress)
buffer_write(argument0, buffer_u16, global.log_medals)
buffer_write(argument0, buffer_u8, global.log_metal_cetain[0])
buffer_write(argument0, buffer_u8, global.log_metal_cetain[1])
buffer_write(argument0, buffer_u8, global.log_metal_cetain[2])
buffer_write(argument0, buffer_u64, global.log_kills)
if !ds_exists(global.log_kill_certain, ds_type_map)
	global.log_kill_certain = ds_map_create()
var killlog = ds_map_write(global.log_kill_certain)
buffer_write(argument0, buffer_string, killlog)
buffer_write(argument0, buffer_u64, global.log_highscore_1)
buffer_write(argument0, buffer_u64, global.log_highscore_2)
