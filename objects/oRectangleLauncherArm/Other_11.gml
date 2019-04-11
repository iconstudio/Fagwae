/// @description Creation
name = "ARM"
velocity_value = player_vspeed * 1.1
velocity_time = 0
velocity_period = seconds(2 - global.extreme * 0.4)

if global.extreme
	shot_period = seconds(max(0.04, 0.1 - global.stage * 0.05))
else
	shot_period = seconds(max(0.08, 0.2 - global.stage * 0.07))
