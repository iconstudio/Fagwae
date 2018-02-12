/// @description Initialization

event_inherited()

global.stage = 1
entrance_caption = "STAGE 1"

area_enemy_push(60, enemy_octagon_2, 0, 115, -48)
area_enemy_push(110, enemy_octagon_2, 0, 400, -48)
area_enemy_push(110, enemy_octagon_2, 0, 210, -48)
//area_enemy_push(10, enemy_octagon_1, 0, 270, -48)
//area_enemy_push(170, enemy_spread_1, 0, 340, -48)

//for (var i = 1; i < 13; ++i)
//	area_enemy_push(90, enemy_hexagon_1, 0, 100 + (i * 187) mod 540, 10)
