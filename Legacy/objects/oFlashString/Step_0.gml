/// @description Updating text

rotation = (rotation + 37) mod 91800

if dmode == 0 {
	if bmode > 0 {
		scale += (1 - scale) * 0.333
	} else {
		scale += (1.6 - scale) * 0.5
		if scale > 1.4
			bmode = 1
	}
} else if dmode == 1 {
	alpha -= 0.02
} else {
	alpha -= 0.1
}

if alpha <= 0
	instance_destroy()
