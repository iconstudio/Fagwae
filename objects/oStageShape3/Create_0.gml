/// @description Initializing stage

event_inherited()

area_enemy_push(60, enemy_octagon_3, 0, 200, 1000)
area_enemy_push(60, enemy_octagon_3, 0, 300, 1000)
area_enemy_push(90, enemy_octagon_3, 0, 340, 1000)
area_enemy_push(130, enemy_rectangle_2, global.px > room_width * 0.5 ? LEFT : RIGHT, 0, 0)
area_enemy_push(60, enemy_octagon_3, 0, 300, 1000)
area_enemy_push(180, enemy_octagon_1, 0, 132, -48)

for (var i = 0; i < 6 + global.extreme * 4; ++i)
	area_script_push(10 + irandom(i), screen_shake, random(10 + i * 0.5) + ceil(i * 0.1) + 2, 0, 0)
area_script_push(10, screen_shake, 20, 0, 0)
area_script_push(10, screen_shake, 10, 0, 0)
