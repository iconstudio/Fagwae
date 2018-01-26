/// @description profile_clear()
/// @function profile_clear

global.setting_music = 7
global.setting_sfx = 10
global.setting_effect = true
global.setting_blur = true

global.status_name = "Fagwae"
global.status_id = string(date_current_datetime())
global.status_dead = 0
global.status_tutorial = false

global.log_opennormal = 1
global.log_openextreme = 0
global.log_highscore_1 = 0
global.log_highscore_2 = 0

global.achievement = []
global.achievement_count = 5
for (var i = 0; i < global.achievement_count; ++i) {
	global.achievement[i] = 0
	global.achievement_getter[i] = 0
}
