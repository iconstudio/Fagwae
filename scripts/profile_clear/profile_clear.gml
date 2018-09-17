/// @function profile_clear()
/// @description 프로필을 초기화합니다.

// setting
global.setting_music = 7
global.setting_sfx = 10
global.setting_effect = true
global.setting_fxaa = true

global.status_name = "FAGWAE"
global.status_id = string(date_current_datetime())
global.status_tutorial = false
global.status_goneextreme = false
global.status_doneextreme = false

global.log_time_total = 0 // second
global.log_deads = 0
global.log_stage_progress = 1
global.log_medals = 0
global.log_metal_cetain = array_create(3, 0)
global.log_kills = 0
global.log_kill_certain = -1 // map
global.log_highscore_1 = 0
global.log_highscore_2 = 0
