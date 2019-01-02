/// @description Update
if draw_mode > 0 {
	frame++
	for (var i = 0; i < 3; ++i) {
		if frame > i * 20 + 12 and rpush[i] != 0
			rpush[i] -= rpush[i] * 0.125
	}

	if rpush[2] < 0.001
		instance_destroy()
	exit
}

frame++
for (var i = 0; i < 3; ++i) {
	if frame > i * 20 + 12 and rpush[i] != 1
		rpush[i] += (1 - rpush[i]) * 0.2
}
