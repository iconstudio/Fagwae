/// @description Creation
name = "ARM"

if global.extreme
	shot_period = seconds(max(0.06, 0.2 - global.stage * 0.5))
else
	shot_period = seconds(max(0.1, 0.5 - global.stage * 0.15))
