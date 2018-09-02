/// @description Updating

if dmode == 0 {
	if lean == 0 {
		if dalpha < timed {
			dalpha++
		} else {
			dalpha = timed
			lean = 1
		}
	} else { // lean == 1
		if dalpha > 0.01 {
			dalpha -= dalpha * 0.166
		} else {
			dalpha = 0
			if progress == 0 {
				progress = 1
				lean = 0
			} else if progress == 1 {
				dmode = 1
			}
		}
	}
} else {
	if rpush > 0.01 {
		rpush -= rpush * 0.1
	} else {
		room_goto_next()
		exit
	}
}
