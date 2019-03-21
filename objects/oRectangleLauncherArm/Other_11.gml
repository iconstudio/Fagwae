/// @description Creation
name = "ARM"

if global.extreme
	shot_period = seconds(max(0.1, 0.4 - global.stage * 0.5))
else
	shot_period = seconds(max(0.3, 1 - global.stage * 0.15))
