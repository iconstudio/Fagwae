/// @description Update

screen_fade(rpush[2])

if draw_mode > 0 {
	frame++
	for (var i = 0; i < 3; ++i) {
		if frame > i * 20 + 12 && rpush[i] != 0
			rpush[i] -= rpush[i] / 3
	}
	
	if rpush[2] < 0.01
		instance_destroy()
	exit
}

frame++
for (var i = 0; i < 3; ++i) {
	if frame > i * 20 + 12 && rpush[i] != 1
		rpush[i] += (1 - rpush[i]) / 2
}
