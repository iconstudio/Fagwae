event_inherited()
/*
switch mode {
	case MENU_STATES.OUTRO_READY: {
		part_coords.foreach_all(function(part) {
			with part {
				move_time += Delta

				var chx, chy, fdist, fdir
				if irandom_range(move_period_min, move_period_max) < move_time {
					move_time = 0
					dx = random_range(-6, 8)
					dy = random_range(-5, 5)
				}

				chx = dx - x
				chy = dy - y
				if chx != 0 or chy != 0 {
					fdist = point_distance(0, 0, chx, chy)
					fdir = point_direction(0, 0, chx, chy)
					if fdist < speed {
						x = dx
						y = dy
					} else {
						x += lengthdir_x(speed, fdir)
						y += lengthdir_y(speed, fdir)
					}
				}
			}
		})

		break
	}
}
