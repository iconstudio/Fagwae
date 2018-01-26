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
global.status_goneextreme = false
global.status_doneextreme = false

global.log_openshape = 1
global.log_openframe = 0
global.log_openindet = 0
global.log_highscore_1 = 0
global.log_highscore_2 = 0

global.achievement_count = 0
global.achievement = []
global.achievement_caption = []
global.achievement_description = []
global.achievement_getter = []

achievement_add("SHIELD GRINDER", "DIE 15 TIMES\nIN NORMAL MODE")
achievement_add("FIRST BLOOD", "GET 100,000 POINTS")
achievement_add("HOW TO FAGWAE", "COMPLETE NORMAL MODE")
achievement_add("BASIC", "DON'T DIE\nIN NORMAL MODE")

achievement_add("GETTING OVER IT", "GET 500,000 POINTS")
achievement_add("GOD MODE", "HAS NO DEAD\nIN EXTREME MODE")
achievement_add("GLORIUS MAN", "COMPLETE EXTREME MODE")
achievement_add("JUNK DEALER", "DESTROY ALL STEAL FRAMES\nIN ANY MODE")

achievement_add("MARATHON", "PLAY FROM FIRST TO LAST AREA")
