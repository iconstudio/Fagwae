/// @description profile_save_log0(data)
/// @function profile_save_log0
/// @param data { buffer }
function profile_save_log0(argument0) {
	// write data
	buffer_write(argument0, buffer_u64, global.log_kills)
	buffer_write(argument0, buffer_u64, global.log_deads)
	buffer_write(argument0, buffer_u8, global.log_stage_progress)
	buffer_write(argument0, buffer_u64, global.log_highscore_1)
	buffer_write(argument0, buffer_u64, global.log_highscore_2)



}
