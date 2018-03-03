/// @description 

if y < room_height - 20 {
	if shot_mode == -1 {
		shot_mode = 0
		alarm[0] = 60 - global.stage * 4
	}
}

if y < room_height - 300 {
	if vspeed != -0.5
		vspeed += (-0.5 - vspeed) * 0.25
}
