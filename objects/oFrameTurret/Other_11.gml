/// @description Creation
untargetable = true

if global.extreme // rotating
	shot_mode = 1
else
	shot_mode = 0
shot_direction = type_create
shot_speed = player_hspeed * 0.333
shot_period = seconds(max(0.075, 0.25 - global.stage * 0.07))
alarm[0] = seconds(1)
