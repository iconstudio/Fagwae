/// @description Initializing stage

event_inherited()

global.__st2_line = 0

/*
area_enemy_push(60, enemy_octagon_4, 0, 185, -48)
area_enemy_push(60, enemy_octagon_4, 0, 255, -48) // +70
area_enemy_push(100, enemy_octagon_4, 0, 325, -48) // +70
area_enemy_push(0, enemy_octagon_4, 0, 294, -48)
area_enemy_push(120, enemy_octagon_1, 0, 481, -48)
*/
for (var i = 0; i < 10; ++i) {
	area_enemy_push(20, enemy_line_1, 1, 580, 480)
	area_enemy_push(20, enemy_line_1, -1, -40, 480)

	area_delay_push(60)
}
area_delay_push(180)
area_enemy_push(0, enemy_octagon_4, 0, 127, -48)		// 127
area_enemy_push(140, enemy_octagon_4, 0, 412, -48)	// -127 - 1

area_enemy_push(70, enemy_spread_2, LEFT, 0, 0)
area_enemy_push(60, enemy_octagon_2, 0, 400, -48)
area_enemy_push(60, enemy_octagon_2, 0, 330, -48) // -70
area_enemy_push(170, enemy_octagon_4, 0, 260, -48) // -70

area_enemy_push(90, enemy_rectangle_1, 0, 244, -48)
if global.extreme {
	area_enemy_push(80, enemy_spread_2, RIGHT, 0, 0)
	area_enemy_push(80, enemy_octagon_4, 0, 240, -48)
	area_enemy_push(60, enemy_octagon_4, 0, 190, -48)
} else {
	area_enemy_push(60, enemy_spread_1, 0, 120, -48)
}

area_delay_push(120)

//area_script_push(0, script_boss_apear, 0, 0, 0)
//area_enemy_push(0, enemy_boss_2, 0, 270, -128)
