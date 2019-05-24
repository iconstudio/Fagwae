/// @description Initialization
event_inherited()
next = oStageShape

available = true

// background
back_color = 0
param_speed = (0.1 * 200 - 10) / 200
back_count = 0
back_factor = 4

// color
current_saturation = 192
current_value = 98
target_saturation = 60
target_value = 21

// back decorataions
deco_count = 0
deco_height = 300

var jako_delay = seconds(0.8)
var jako_left_first = global.px > room_width * 0.5
var jako_path_list = [pathScoutNormalRight, pathScoutNormalLeft, pathScoutNormalRight, pathScoutNormalLeft, pathScoutRoamARight, pathScoutRoamALeft]
var jako_intro_path_selected = jako_path_list[jako_left_first]
var jako_fence_path_selected = jako_path_list[3 - jako_left_first]
var jako_roams_path_selected = jako_path_list[5 - jako_left_first]
var jako_shooter = global.extreme ? enemy_scout_j2 : enemy_scout_j1

// Initializing stage
script_stage3_ready()
area_enemy_push(jako_delay, enemy_scout_c1, jako_intro_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_intro_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_intro_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_intro_path_selected, 0, 0)
area_enemy_push(seconds(4), jako_shooter, jako_intro_path_selected, 0, 0)

area_enemy_push(jako_delay, enemy_scout_c1, jako_fence_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_fence_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_fence_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_fence_path_selected, 0, 0)
area_enemy_push(seconds(4), jako_shooter, jako_fence_path_selected, 0, 0)

area_enemy_push(jako_delay, enemy_scout_c1, jako_roams_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_roams_path_selected, 0, 0)
area_enemy_push(jako_delay, jako_shooter, jako_roams_path_selected, 0, 0)
area_enemy_push(jako_delay, jako_shooter, jako_roams_path_selected, 0, 0)
area_enemy_push(seconds(4), enemy_scout_j2, jako_roams_path_selected, 0, 0)

/*
for (var j = 0; j < 7; ++j) {
	for (var i = 0; i < 8; ++i)
		area_enemy_push(0, enemy_triangle_1, 0, 266 + i * 10 + random(20), -15 - random(10))
	area_delay_push(random_range(seconds(0.01), seconds(0.1)))
}
area_delay_push(seconds(1))
*/

//area_enemy_push(seconds(2), enemy_crawler_1, 0, 270, 300)
//area_enemy_push(seconds(2), enemy_crab_1, RIGHT, 0, 500)
//area_enemy_push(seconds(2), enemy_crab_1, LEFT, 0, 500)
//area_enemy_push(seconds(2), enemy_octopod_1, 0, 270, 100)


