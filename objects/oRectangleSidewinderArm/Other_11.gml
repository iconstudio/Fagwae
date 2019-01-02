/// @description Creation
homing = false
home_angle = 0

if global.extreme
	shot_period = seconds(max(0.01, 0.3 - global.stage * 0.5))
else
	shot_period = seconds(max(0.035, 0.4 - global.stage * 0.9))

