/// @description Initializing stage

event_inherited()

area_enemy_push(0, enemy_octagon_4, 0, 255, -48) // +85

area_delay_push(240)

area_script_push(0, script_boss_apear, 0, 0, 0)
area_enemy_push(0, enemy_boss_1, 0, 270, -128)

global.status_tutorial = true
