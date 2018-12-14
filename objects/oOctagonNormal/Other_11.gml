/// @description Creation

vspeed = 12

shot_speed = 4.5 + global.stage * 0.25
shot_count = 0
if global.extreme
	shot_period = seconds(max(0.01, 0.1 - global.stage * 0.04))
else
	shot_period = seconds(max(0.02, 0.15 - global.stage * 0.06))
if global.extreme
	shot_period_reset = seconds(max(0.05, 0.166 - global.stage * 0.2) + 0.14)
else
	shot_period_reset = seconds(max(0.1, 1 - global.stage * 0.37) + 0.14)
alarm[0] = seconds(1)
