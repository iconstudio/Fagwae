/// @function profile_read_log0(data)
/// @description 프로필 중 통계를 읽어옵니다.
/// @param data { buffer }
global.log_kills = buffer_read(argument0, buffer_u64)
global.log_deads = buffer_read(argument0, buffer_u64)
global.log_stage_progress = buffer_read(argument0, buffer_u8)
global.log_highscore_1 = buffer_read(argument0, buffer_u64)
global.log_highscore_2 = buffer_read(argument0, buffer_u64)

return true
