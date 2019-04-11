/// @description Creation
untargetable = true

if global.extreme // rotating
	shot_mode = 1
else
	shot_mode = 0
shot_direction = type_create
shot_speed = player_hspeed * 0.79
shot_period = seconds(0.4 - global.extreme * 0.1)
alarm[0] = seconds(1)
