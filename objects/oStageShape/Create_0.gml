/// @description Initialization
event_inherited()
next = oStageFrame

// background
back_color = 0
param_speed = (0.1 * 192 - 5) / 192
back_speed_begin = room_height / seconds(3)
back_speed_target = room_height / seconds(7)
back_speed = back_speed_begin
back_speed_gap = back_speed_target - back_speed_begin
back_time = 0
back_period = seconds(4)

// back decorataions
back_count = 0
deco_hue = 0
deco_min = -10
deco_min_opt = -5
deco_count = 3
deco_mode = 0
deco_fail = false
deco_fail_period = seconds(1)

global.extreme = true
// Initializing stage
line_image_index = 0
var jako_delay = seconds(0.7)
var octo_type = global.extreme ? enemy_octagon_4 : enemy_octagon_2

script_stage1_ready()
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 90, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 120, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 150, -48)
area_enemy_push(seconds(1), enemy_octagon_4, pathJakoFormationLeft, 180, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationRight, 420, -48)
area_enemy_push(jako_delay * 2, octo_type, 0, 390, -48)
//*
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
area_enemy_push(seconds(3.2), enemy_hexagon_1, 0, (++k * 194) mod 540, -48)

if global.extreme {
	area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 170, -48)
	area_enemy_push(seconds(2), enemy_rectangle_1, 0, 255, -48) // +85
}
area_enemy_push(seconds(1.9), enemy_rectangle_1, 0, 112, -48)
area_enemy_push(seconds(3.6), enemy_rectangle_1, 0, 409, -48)

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
		if ++cframe_count > 2 { // includes 1, 2
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
	area_delay_push(seconds(2))

	cframe_speed = -cframe_speed
	cframe_count--
}
//*/

area_delay_push(seconds(8))
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
area_enemy_push(seconds(3), enemy_octagon_1, 0, 480, -48)

area_enemy_push(jako_delay * 0.5, enemy_octagon_4, 0, 265, -48)
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 195, -48) // -70
area_enemy_push(jako_delay, enemy_octagon_5, pathJakoFormationLeft, 125, -48) // -70

//for (var i = 0; i < 8; ++i) {
//	area_enemy_push(0, enemy_line_1, 1, 580, 480)
//	area_enemy_push(0, enemy_line_1, -1, -40, 480)

//	area_delay_push(global.extreme ? seconds(0.9) : area_delay_push(seconds(1))
//}

area_enemy_push(0, enemy_octagon_4, 0, 127, -48)		// 127
area_enemy_push(seconds(1), enemy_octagon_4, 0, 412, -48)	// w - 127 - 1

area_enemy_push(seconds(3.6), enemy_spread_2, LEFT, 0, 0)
area_enemy_push(seconds(1.8), enemy_octagon_4, 0, 330, -48)
area_enemy_push(seconds(1.8), enemy_octagon_4, 0, 330, -48)
area_enemy_push(0, enemy_octagon_4, 0, 330, -48)
area_script_push(0, script_await_clearing, 0, 0, 0)
area_delay_push(seconds(3))

var firstrect = choose(LEFT, RIGHT)
area_enemy_push(seconds(0.4), enemy_rectangle_2, firstrect, 0, 400 + random(20))
area_enemy_push(seconds(0.4), enemy_rectangle_2, !firstrect, 0, 300 + random(20))
area_enemy_push(0, enemy_rectangle_2, firstrect, 0, 200 + random(20))
area_script_push(seconds(2), script_await_clearing, 0, 0, 0)

if global.extreme {
	area_enemy_push(seconds(2.9), enemy_spread_2, RIGHT, 0, 0)
	area_enemy_push(seconds(1.5), enemy_octagon_4, 0, 240, -48)
	area_enemy_push(0, enemy_octagon_4, 0, 190, -48)
	area_script_push(seconds(3), script_await_clearing, 0, 0, 0)
} else {
	area_script_push(0, script_await_dying, 0, 0, 0)
	area_enemy_push(seconds(2), enemy_spread_1, 0, 270, -48)
}
area_delay_push(seconds(1))

k = 0
area_enemy_push(seconds(0.9), enemy_line_2, 1, 345, -500)
area_enemy_push(seconds(0.1), enemy_line_2, 0, 30, -500)
for (; k < 4; ++k)
	area_enemy_push(seconds(0.13 * (random(k) * 7) mod 4), enemy_line_2, k & 1, min(max(20, 40 + (k * 219) mod 540), 520), -500 + random(20))
area_enemy_push(seconds(0.05), enemy_line_2, 0, 508, -500 + random(20))
k = 0
for (; k < 4; ++k)
	area_enemy_push(seconds(0.11 + 0.1 * (random(k) * 5) mod 3), enemy_line_2, k & 1, min(max(20, 40 + (k * 219) mod 540), 520), -500 + random(20))
area_script_push(0, script_await_dying, 0, 0, 0)
area_enemy_push(seconds(0.1), enemy_line_2, 0, 318, -500)
area_delay_push(seconds(2))

area_script_push(seconds(0.2), script_boss_apear, 0, 0, 0)
area_music_push(seconds(0.5), musicBoss)
area_enemy_push(0, enemy_boss_2, 0, 270, -128)
area_script_push(0, script_stage_clear, 0, 0, 0)

area_delay_push(seconds(2))
area_script_push(0, script_shape_disappear, 0, 0, 0)
area_delay_push(seconds(10))
