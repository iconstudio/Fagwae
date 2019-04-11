/// @description Creation
name = "ARM"
velocity_value = player_vspeed * 2.5
velocity_time = 0
velocity_period = seconds(1)

homing = false
homing_time = 0
homing_period = seconds(3)

if global.extreme
	shot_period = seconds(max(0.1, 0.2 - global.stage * 0.05))
else
	shot_period = seconds(max(0.2, 0.5 - global.stage * 0.15))
