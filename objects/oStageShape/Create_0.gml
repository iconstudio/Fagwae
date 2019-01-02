/// @description Initialization
event_inherited()
global.stage = 1
next = oStageFrame

// background
back_color = 0
square_saturation = 0
param_speed = (0.1 * 192 - 5) / 192
back_speed = 10
back_speed_target = 10
back_time = 0
back_period = seconds(2)

// back decorataions
back_count = 0
deco_min = -10
deco_min_opt = -5
deco_count = 3
deco_mode = 0
deco_fail = false
deco_fail_complete = false
deco_shake_period = seconds(0.1)
deco_fail_period = seconds(0.5)

global.extreme = true
// Initializing stage
global.__st2_line = 0
var jako_delay = seconds(0.7)
var octo_type = enemy_octagon_2
if global.extreme
	octo_type = enemy_octagon_4

script_stage1_ready()
/*
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 90, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 120, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 150, -48)
area_enemy_push(seconds(1), enemy_octagon_4, pathJakoFormationLeft, 180, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, 420, -48)
area_enemy_push(jako_delay * 2, octo_type, 0, 390, -48)

var cox = 384 + random(100)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, cox, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, cox, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, cox, -48)
area_enemy_push(seconds(1), octo_type, 0, cox - 260, -64)
area_enemy_push(jako_delay * 2, enemy_octagon_5, pathJakoFormationLeft, cox - 260, -48)
area_enemy_push(jako_delay, octo_type, 0, 260, -64)
area_enemy_push(seconds(1.7), enemy_octagon_4, 0, 290, -64)

area_enemy_push(seconds(1.3), enemy_hexagon_1, 0, 400, -48)
area_enemy_push(seconds(1), enemy_hexagon_1, 0, 290, -48)
var k = 0
for (; k < 7; ++k)
	area_enemy_push(seconds(1.5), enemy_hexagon_2, 0, (k * 194) mod 540, -48)
area_enemy_push(seconds(1.8), enemy_hexagon_1, 0, (++k * 194) mod 540, -48)

if global.extreme {
	area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 170, -48)
	area_enemy_push(seconds(2.1), enemy_rectangle_1, 0, 255, -48) // +85
}
area_enemy_push(seconds(3), enemy_spread_1, 0, 350, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, 310, -48)
area_enemy_push(jako_delay, octo_type, 0, 380, -48)
area_enemy_push(seconds(2.5), octo_type, 0, 470, -48) 

// imported from original fagwae.
var cframe_speed = 0.5
var cframe_count = 0
var cframe_turret = 0
var cframe_factor = 1
var cframe_nx = 0

for (var j = 0; j < 14; ++j) { // 14 rows
	cframe_factor = sign(cframe_speed)
	for (var i = 0; i < 6; ++i) { // 6 columns
		if ++cframe_count > 2 { // includes 0, 1 2
			cframe_count = 0
			continue
		}

		cframe_turret += 0.9
		cframe_nx = (i - cframe_factor) * 128
		if (cframe_turret > 2) { // creating a square with turret
			area_enemy_push(0, enemy_square_2, cframe_speed, cframe_nx, -48)
			cframe_turret -= 2
		} else { // creating a empty square
			area_enemy_push(0, enemy_square_1, cframe_speed, cframe_nx, -48)
		}
	}
	area_delay_push(128)

	cframe_speed = -cframe_speed
	cframe_count--
}

area_delay_push(seconds(6))

area_script_push(seconds(0.2), script_boss_apear, 0, 0, 0)
area_music_push(seconds(0.5), musicBoss)
area_enemy_push(0, enemy_boss_1, 0, 270, -128)
area_script_push(0, script_stage_clear, 0, 0, 0)

// ================================================
script_stage2_ready()
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, 450, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, 420, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, 390, -48)
area_enemy_push(jako_delay * 2, enemy_octagon_5, pathJakoFormationRight, 360, -48)

area_enemy_push(jako_delay, enemy_octagon_4, 0, 185, -48)
area_enemy_push(jako_delay, enemy_octagon_4, 0, 255, -48) // +70
area_enemy_push(jako_delay, enemy_octagon_4, 0, 325, -48) // +70
area_enemy_push(jako_delay, enemy_octagon_4, 0, 395, -48)
area_enemy_push(seconds(3.2), enemy_octagon_1, 0, 480, -48)

area_enemy_push(jako_delay * 0.5, enemy_octagon_4, 0, 265, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 195, -48) // -70
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 125, -48) // -70

//for (var i = 0; i < 8; ++i) {
//	area_enemy_push(0, enemy_line_1, 1, 580, 480)
//	area_enemy_push(0, enemy_line_1, -1, -40, 480)

//	if global.extreme
//		area_delay_push(seconds(0.9))
//	else
//		area_delay_push(seconds(1))
//}

area_delay_push(seconds(1.6))
area_enemy_push(0, enemy_octagon_4, 0, 127, -48)		// 127
area_enemy_push(140, enemy_octagon_4, 0, 412, -48)	// w - 127 - 1

area_enemy_push(seconds(3.5), enemy_spread_2, LEFT, 0, 0)
area_enemy_push(seconds(1.4), enemy_octagon_4, 0, 330, -48)
area_enemy_push(seconds(1.2), enemy_octagon_2, 0, 330, -48)
area_enemy_push(seconds(2), enemy_octagon_4, 0, 330, -48)
area_script_push(seconds(1), script_await_dying, 0, 0, 0)

if global.extreme {
	area_enemy_push(0, enemy_rectangle_2, choose(LEFT, RIGHT), 0, 400 + random(20))
	area_enemy_push(0, enemy_rectangle_2, choose(LEFT, RIGHT), 0, 300 + random(20))
	area_enemy_push(0, enemy_rectangle_2, choose(LEFT, RIGHT), 0, 200 + random(20))
	area_script_push(seconds(3), script_await_dying, 0, 0, 0)
} else {
	area_enemy_push(seconds(2), enemy_rectangle_1, 0, 112, -48)
	area_enemy_push(seconds(3), enemy_rectangle_1, 0, 409, -48)
}
if global.extreme {
	area_enemy_push(seconds(2.9), enemy_spread_2, RIGHT, 0, 0)
	area_enemy_push(seconds(1.5), enemy_octagon_4, 0, 240, -48)
	area_enemy_push(seconds(1.5), enemy_octagon_4, 0, 190, -48)
} else {
	area_enemy_push(seconds(2), enemy_spread_1, 0, 120, -48)
}
area_delay_push(seconds(0.5))

k = 0
area_enemy_push(seconds(0.9), enemy_line_2, 1, 345, -500)
area_enemy_push(seconds(0.1), enemy_line_2, 0, 30, -500)
for (; k < 4; ++k)
	area_enemy_push(seconds(0.2 * (random(k) * 7) mod 4), enemy_line_2, k & 1, min(max(20, 40 + (k * 219) mod 540), 520), -500 + random(20))
area_enemy_push(seconds(0.2), enemy_line_2, 0, 508, -500 + random(20))
k = 0
for (; k < 4; ++k)
	area_enemy_push(seconds(0.15 + 0.1 * (random(k) * 5) mod 3), enemy_line_2, k & 1, min(max(20, 40 + (k * 219) mod 540), 520), -500 + random(20))
area_script_push(0, script_await_dying, 0, 0, 0)
area_enemy_push(seconds(0.1), enemy_line_2, 0, 318, -500)

area_script_push(seconds(0.2), script_boss_apear, 0, 0, 0)
area_music_push(seconds(0.5), musicBoss)
area_enemy_push(0, enemy_boss_2, 0, 270, -128)
area_script_push(0, script_stage_clear, 0, 0, 0)
//*/
area_delay_push(seconds(2))
area_script_push(seconds(1), script_shape_disappear, 0, 0, 0)
area_delay_push(seconds(3))
area_script_push(0, area_goto_next, 0, 0, 0)
