/// @description Creation
name = "ARM"

shot_speed = room_width / seconds(3.1)
alarm[0] = seconds(0.5)
if global.extreme
	shot_period = seconds(max(0.05, 0.2 - global.stage * 0.333))
else
	shot_period = seconds(max(0.1, 0.4 - global.stage * 1))
