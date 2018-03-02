/// @description Initializing stage

event_inherited()
/*
global.stage = 1
entrance_caption = "STAGE 1"

if !global.status_tutorial
	area_message_push(60, "ARROW KEY TO MOVE", global.screen_gui_cx, global.screen_gui_cy)
if !global.status_tutorial
	area_message_push(0, "Z KEY TO ATTACK", global.screen_gui_cx, global.screen_gui_cy)

area_enemy_push(60, enemy_octagon_4, 0, 255, -48)
area_enemy_push(60, enemy_octagon_4, 0, 185, -48) // -70
area_enemy_push(60, enemy_octagon_4, 0, 115, -48) // -70
area_enemy_push(90, enemy_octagon_2, 0, 150, -48) // +35

area_enemy_push(90, enemy_hexagon_1, 0, 400, -48)
area_enemy_push(90, enemy_hexagon_1, 0, 290, -48)
var i = 0
for (i = 0; i < 7; ++i)
	area_enemy_push(90, enemy_hexagon_2, 0, (i * 194) mod 540, -48)
area_enemy_push(160, enemy_hexagon_1, 0, (++i * 194) mod 540, -48)

if global.extreme {
	area_enemy_push(30, enemy_octagon_4, 0, 170, -48)
	area_enemy_push(0, enemy_octagon_4, 0, 255, -48) // +85
}
area_enemy_push(200, enemy_spread_1, 0, 370, -48) // w - 170

var octo_type = enemy_octagon_4
if global.extreme
	octo_type = enemy_octagon_2
area_enemy_push(60, enemy_octagon_4, 0, 270, -48)
area_enemy_push(60, octo_type, 0, 380, -48) // +90
area_enemy_push(180, octo_type, 0, 470, -48) // +90

// imported from original fagwae.
var cframe_speed = 0.5
var cframe_count = 0
var cframe_turret = 0
var cframe_factor = 1
var cframe_ny = 0

for (var j = 0; j < 14; ++j) { // 14 rows
	cframe_factor = sign(cframe_speed)
	for (var i = 0; i < 6; ++i) { // 6 columns
		if ++cframe_count > 2 { // includes 0, 1 2
			cframe_count = 0
			continue
		}

		cframe_turret += 0.9
		cframe_ny = (i - cframe_factor) * 128
		if (cframe_turret > 2) { // creating a square with turret
			area_enemy_push(0, enemy_square_2, cframe_speed, cframe_ny, -48)
			cframe_turret -= 2
		} else { // creating a empty square
			area_enemy_push(0, enemy_square_1, cframe_speed, cframe_ny, -48)
		}
	}
	area_delay_push(128)

	cframe_speed = -cframe_speed
	cframe_count--
}

area_delay_push(240)
//*/
area_script_push(0, script_boss_apear, 0, 0, 0)
area_enemy_push(0, enemy_boss_1, 0, 270, -128)

global.status_tutorial = true
