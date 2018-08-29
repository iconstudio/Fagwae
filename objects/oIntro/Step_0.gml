/// @description Updating

if dmode == 0 {
	if dalpha < 1 {
		dalpha += 0.05
	} else {
		dalpha = 1
	}
	exit
} else {
	if dalpha > -2 {
		dalpha += (-4 - dalpha) * 0.00333
	} else {
		instance_destroy()
		room_goto_next()
		exit
	}
}
