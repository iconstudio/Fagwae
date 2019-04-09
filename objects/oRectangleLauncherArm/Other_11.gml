/// @description Creation
name = "ARM"

if global.extreme
	shot_period = seconds(max(0.04, 0.1 - global.stage * 0.05))
else
	shot_period = seconds(max(0.08, 0.2 - global.stage * 0.07))
