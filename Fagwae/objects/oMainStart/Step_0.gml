event_inherited()

switch mode {
	case MENU_STATES.INTRO: {
		var intro_ratio = parent.mode_ratio
		if intro_ratio < 1 { // the part pillars are getting high up
			var intro_index = min(3 + ease.out_quart(intro_ratio) * parts_number, parts_number)

			part_coords.foreach_n(0, intro_index, function(part) {
				with part {
					var pillar_ratio = pillar_time / pillar_period
					if pillar_ratio < 1 {
						image_alpha = lerp(0, 1, ease.in_circ(pillar_ratio))
						y = lerp(ystart, 0, ease.out_cubic(pillar_ratio))

						pillar_time += Delta
					} else {
						image_alpha = 1
						y = 0
					}
				}
			})
		}

		break
	}

	case MENU_STATES.INTRO_END: {
		part_coords.foreach_all(function(part) { // debug
			part.image_alpha = 1
			part.y = 0
		})
		shuffle_parts()

		break
	}

	case MENU_STATES.NORMAL: {
		//

		break
	}

	case MENU_STATES.OPENING_1: { // outgoing mode (fadeout)
		var mid_ratio = tr_open_1_time / tr_open_1_period

		// disappear
		if mid_ratio < 1 {
			var mid_index = min(2 + ease.inout_cubic(mid_ratio) * parts_number * 1.5, parts_number)
			part_coords.foreach_n(0, mid_index, function(part) {
				with part {
					var flip_ratio = flip_time / flip_period
					if flip_ratio < 1 {
						xangle = lerp(0, 90, ease.out_circ(flip_ratio))
						image_alpha = lerp(1, 0, (flip_ratio * 1.2))

						flip_time += Delta
					} else {
						xangle = 90
					}
				}
			})
		} else { // cleanup the middle transition
			part_coords.foreach_all(function(part) {
				part.flip_time = 0
				part.image_alpha = 0
			})
			x = tr_open_x
			y = tr_open_y
		}

		break
	}

	case MENU_STATES.OPENING_2: { // place mode (fadein)
		var late_ratio = tr_open_2_time / tr_open_2_period
	
		// appear onto new position
		if late_ratio < 1 {
			var late_index = min(ease.inout_quad(late_ratio) * parts_number, parts_number)
			part_coords.foreach_n(0, late_index, function(part) {
				with part {
					var flip_ratio = flip_time / flip_period
					if flip_ratio < 1 {
						xangle = lerp(90, 0, ease.out_quart(flip_ratio))
						image_alpha = lerp(0, 1, (flip_ratio * 1.2))

						flip_time += Delta
					} else {
						xangle = 0
					}
				}
			})
		}

		break
	}

	case MENU_STATES.OPENED: { // cleanup mode (done)
		mode = MENU_STATES.NORMAL

		tr_open_mid_time = 0
		part_coords.foreach_all(function(part) {
			part.flip_time = 0
			part.xangle = 0
			part.image_alpha = 1
		})
		shuffle_parts()

		break
	}

	case MENU_STATES.CLOSING: { // outgoing mode
		var trans_ratio = tr_close_time / tr_close_period
		if trans_ratio < 1 {
			var counts = min(2 + ease.inout_cubic(trans_ratio) * parts_number * 1.5, parts_number)
			part_coords.foreach_n(0, counts, function(part) {
				with part {
					var flip_ratio = flip_time / flip_period
					if flip_ratio < 1 {
						image_alpha = lerp(1, 0, (flip_ratio * 1.2))

						flip_time += Delta
					} else {
						xangle = 90
					}
				}
			})
		}

		break
	}

	case MENU_STATES.CLOSED: {
		mode = MENU_STATES.NORMAL

		x = xstart
		y = ystart
		part_coords.foreach_all(function(part) {
			part.flip_time = 0
			part.xangle = 0
		})
		shuffle_parts()

		break
	}

	case MENU_STATES.OUTRO: {
		image_alpha -= 0.4

		break
	}

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
