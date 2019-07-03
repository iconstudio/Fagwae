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

// Initializing stage
var jako_delay = seconds(0.4)
var jako_left_first = global.px > room_width * 0.5
var jako_path_list = [pathScoutNormalRight, pathScoutNormalLeft, pathScoutNormalRight, pathScoutNormalLeft, pathScoutRoamARight, pathScoutRoamALeft, pathScoutRoamBRight, pathScoutRoamBLeft]
var jako_intro_path_selected = jako_path_list[jako_left_first]
var jako_intro_path_selected_inverted = jako_path_list[1 - jako_left_first]
var jako_fence_path_selected = jako_path_list[2 + jako_left_first]
var jako_roams_path_selected = jako_path_list[4 + jako_left_first]
var jako_pushs_path_selected = jako_path_list[6 + jako_left_first]
var jako_pushs_path_selected_inverted = jako_path_list[7 - jako_left_first]
var jako_shooter = global.extreme ? enemy_scout_j2 : enemy_scout_j1

#region STAGE 1
script_stage3_ready()
//*
area_enemy_push(jako_delay, enemy_scout_c1, jako_intro_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_intro_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_intro_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_intro_path_selected, 0, 0)
area_enemy_push(seconds(3.1), jako_shooter, jako_intro_path_selected, 0, 0)

if global.extreme {
	area_enemy_push(jako_delay, enemy_scout_c2, jako_pushs_path_selected, 0, 0)
	area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
	area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
	area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
	area_enemy_push(seconds(3.1), enemy_scout_j2, jako_pushs_path_selected, 0, 0)
} else {
	area_enemy_push(jako_delay, enemy_scout_c1, jako_fence_path_selected, 0, 0)
	area_enemy_push(jako_delay, enemy_scout_j1, jako_fence_path_selected, 0, 0)
	area_enemy_push(jako_delay, enemy_scout_j1, jako_fence_path_selected, 0, 0)
	area_enemy_push(jako_delay, enemy_scout_j1, jako_fence_path_selected, 0, 0)
	area_enemy_push(seconds(3.1), enemy_scout_j2, jako_fence_path_selected, 0, 0)
}

area_enemy_push(jako_delay, enemy_scout_c1, jako_roams_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j1, jako_roams_path_selected, 0, 0)
area_enemy_push(jako_delay, jako_shooter, jako_roams_path_selected, 0, 0)
area_enemy_push(jako_delay, jako_shooter, jako_roams_path_selected, 0, 0)
area_enemy_push(seconds(3.1), enemy_scout_j2, jako_roams_path_selected, 0, 0)

var jako_pair_left_x = 50 + random(room_width - 120)
var jako_pair_shooter = global.extreme ? enemy_scout_j4 : enemy_scout_j3
area_enemy_push(0, enemy_scout_j3, 0, jako_pair_left_x, 0)
area_enemy_push(seconds(2.2), enemy_scout_j3, 0, jako_pair_left_x + 70, 0)
jako_pair_left_x = 50 + random(room_width - 120)
area_enemy_push(0, jako_pair_shooter, 0, jako_pair_left_x, 0)
area_enemy_push(seconds(2.2), enemy_scout_j4, 0, jako_pair_left_x + 70, 0)
jako_pair_left_x = 50 + random(room_width - 120)
area_enemy_push(0, enemy_scout_j3, 0, jako_pair_left_x, 0)
area_enemy_push(seconds(1.2), jako_pair_shooter, 0, jako_pair_left_x + 70, 0)
area_enemy_push(seconds(3.1), jako_pair_shooter, 0, room_width - jako_pair_left_x, 0)

area_enemy_push(0, enemy_scout_j3, 0, 210, 0)
area_enemy_push(0, jako_pair_shooter, 0, choose(180, 360), 0)
area_enemy_push(seconds(2.5), enemy_scout_j3, 0, 330, 0)
jako_pair_left_x = 40 + random(100)
area_enemy_push(0, enemy_scout_j4, 0, jako_pair_left_x, 0)
area_enemy_push(0, enemy_scout_j3, 0, jako_pair_left_x + 70, 0)
area_enemy_push(0, enemy_scout_j3, 0, room_width - jako_pair_left_x, 0)
area_enemy_push(seconds(3), enemy_scout_j4, 0, room_width - jako_pair_left_x - 70, 0)

area_enemy_push(jako_delay, enemy_scout_c2, jako_intro_path_selected_inverted, 0, 0)
area_enemy_push(jako_delay, jako_shooter, jako_intro_path_selected_inverted, 0, 0)
area_enemy_push(jako_delay, jako_shooter, jako_intro_path_selected_inverted, 0, 0)
area_enemy_push(jako_delay, jako_shooter, jako_intro_path_selected_inverted, 0, 0)
area_enemy_push(seconds(3.1), jako_shooter, jako_intro_path_selected_inverted, 0, 0)

var square_hspeed = (jako_left_first ? -1 : 1) * 0.5
var square_captain_x1 = jako_left_first ? 260 : 280
var square_captain_x2 = jako_left_first ? 280 : 260
area_enemy_push(seconds(2), enemy_square_h, 0, 270, -64)
repeat 4 {
	area_enemy_push(0, enemy_square_1, square_hspeed, 0, -56)
	area_enemy_push(0, enemy_square_1, square_hspeed, 130, -56)
	area_enemy_push(0, enemy_square_h, square_hspeed, square_captain_x1, -56)
	area_enemy_push(0, enemy_square_1, square_hspeed, 410, -56)
	area_enemy_push(seconds(2), enemy_square_1, square_hspeed, 540, -56)
	if global.extreme
		area_enemy_push(0, enemy_scout_j2, noone, 270, -64)
	area_enemy_push(0, enemy_square_1, -square_hspeed, 0, -56)
	area_enemy_push(0, enemy_square_1, -square_hspeed, 130, -56)
	area_enemy_push(0, enemy_square_h, -square_hspeed, square_captain_x2, -56)
	area_enemy_push(0, enemy_square_1, -square_hspeed, 410, -56)
	area_enemy_push(seconds(2), enemy_square_1, -square_hspeed, 540, -56)
}
area_enemy_push(0, enemy_square_1, square_hspeed, 0, -56)
area_enemy_push(0, enemy_square_1, square_hspeed, 130, -56)
area_enemy_push(0, enemy_square_h, square_hspeed, square_captain_x1, -56)
area_enemy_push(0, enemy_square_1, square_hspeed, 410, -56)
area_enemy_push(seconds(8), enemy_square_1, square_hspeed, 540, -56)
//*/
var piles_supporter = global.extreme ? enemy_scout_j4 : enemy_scout_j2
var piles_positions = [60, room_width - 60, 150, -150]
var piles_choice = choose(0, 1)
var piles_position = piles_positions[piles_choice] + random(piles_positions[2 + piles_choice])
area_enemy_push(seconds(1), enemy_piles_1, 0, piles_position, -110)
area_enemy_push(seconds(5.9), piles_supporter, noone, room_width - piles_position, -70)
piles_position = piles_positions[1 - piles_choice] + random(piles_positions[3 - piles_choice])
area_enemy_push(seconds(1), enemy_piles_1, 0, piles_position, -110)
area_enemy_push(seconds(5.9), piles_supporter, noone, room_width - piles_position, -70)
piles_position = piles_positions[piles_choice] + random(piles_positions[2 + piles_choice])
area_enemy_push(seconds(1), enemy_piles_1, 0, piles_position, -110)
area_enemy_push(seconds(5.9), piles_supporter, noone, room_width - piles_position, -70)
piles_position = piles_positions[1 - piles_choice] + random(piles_positions[3 - piles_choice])
area_enemy_push(0, piles_supporter, noone, room_width - piles_position, -70)
area_enemy_push(seconds(3), enemy_piles_1, 0, piles_position, -110)
area_script_push(0, script_await_clearing, 0, 0, 0)
area_delay_push(seconds(3))

area_enemy_push(jako_delay, enemy_scout_c2, jako_pushs_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
area_enemy_push(seconds(3), enemy_scout_j2, jako_pushs_path_selected, 0, 0)

area_enemy_push(0, enemy_scout_c2, jako_pushs_path_selected_inverted, 0, 0)
area_enemy_push(jako_delay, enemy_scout_c2, jako_pushs_path_selected, 0, 0)
area_enemy_push(0, enemy_scout_j2, jako_pushs_path_selected_inverted, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
area_enemy_push(0, enemy_scout_j2, jako_pushs_path_selected_inverted, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
area_enemy_push(0, enemy_scout_j2, jako_pushs_path_selected_inverted, 0, 0)
area_enemy_push(jako_delay, enemy_scout_j2, jako_pushs_path_selected, 0, 0)
area_enemy_push(0, enemy_scout_j2, jako_pushs_path_selected_inverted, 0, 0)
area_enemy_push(seconds(6), enemy_scout_j2, jako_pushs_path_selected, 0, 0)

area_script_push(seconds(0.2), script_boss_apear, 0, 0, 0)
area_music_push(seconds(0.5), musicBoss)
area_enemy_push(0, enemy_boss_3, 0, 270, -128)
area_script_push(0, script_stage_clear, 0, 0, 0)
#endregion

area_delay_push(seconds(2))

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


