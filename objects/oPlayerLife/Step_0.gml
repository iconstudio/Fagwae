if blockable {
	if x < bleft {
		x = bleft
		hspeed *= -1
	} else if x > bright {
		x = bright
		hspeed *= -1
	}

	if y < btop {
		y = btop
		vspeed *= -1
	} else if y > bbottom {
		y = bbottom
		vspeed *= -1
	}
}

if enable {
	if homing {
		if !global.playeralive {
			homing = false
			exit
		}
		direction = point_direction(x, y, global.px, global.py)
		speed = 8
	} else if global.playeralive {
		if point_distance(x, y, global.px, global.py) <= 128
			homing = true
	}
}
