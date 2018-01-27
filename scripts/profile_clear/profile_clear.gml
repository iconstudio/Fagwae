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

global.achievement_count = 0 // 도전과제 갯수
global.achievement = [] // 도전과제에서 저장되는 정보 (불린 아님)
global.achievement_cleared = [] // 도전과제 달성 여부
global.achievement_caption = [] // 제목
global.achievement_description = [] // 설명
global.achievement_updater = [] // 도전과제 검사 스크립트
global.achievement_getter = [] // 도전과제를 지금 달성할 수 있는가

// easy
achievement_add("SHIELD GRINDER", "DIE 15 TIMES\nIN ANY MODE", trophy_check0)
achievement_add("FIRST BLOOD", "GET 100000 POINTS", trophy_check1)
achievement_add("HOW TO FAGWAE", "COMPLETE NORMAL MODE", trophy_check2)
achievement_add("BASIC", "DON'T DIE\nIN NORMAL MODE", trophy_check3)

// hard
achievement_add("GETTING OVER IT", "GET 500000 POINTS", trophy_check4)
achievement_add("GOD MODE", "DON'T DIE\nIN EXTREME MODE", trophy_check5)
achievement_add("GLORIUS MAN", "COMPLETE EXTREME MODE", trophy_check6)
achievement_add("JUNK DEALER", "DESTROY ALL STEAL FRAMES\nIN ANY MODE", trophy_check7)

// other
achievement_add("MARATHON", "PLAY FROM FIRST\n TO LAST AREA", trophy_check8)
