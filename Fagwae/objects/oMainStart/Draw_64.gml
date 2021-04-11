switch mode {
	case MENU_STATES.OPENING_1:
	case MENU_STATES.OPENING_2:
	case MENU_STATES.CLOSING: {
		part_coords.foreach_all(function(part) {
			var dx = x, dy = y
			with part {
				draw_transform_set_translation(0, -bbox_top, 0)
				draw_transform_add_rotation_x(xangle)
				draw_transform_add_translation(dx + x, dy + y, 0)
				draw_transform_add_translation(0, bbox_top, 0)
				draw_sprite_ext(sMainMenuFrameStart, image_index, 0, 0, 1, 1, 0, $ffffff, image_alpha)
				draw_transform_set_identity()
			}
		})

		break
	}

	case MENU_STATES.INTRO: {
		part_coords.foreach_all(function(part) {
			var oalpha = part.image_alpha, dalpha
			if oalpha < 0.5 {
				dalpha = oalpha * 1.6 // ~0.8
			} else {
				dalpha = 0.8 - oalpha * 2
			}

			var dx = x, dy = y
			with part
				draw_sprite_ext(sMainMenuFrameStartIntro, image_index, dx + x, dy + y, 1, 1, 0, $ffffff, dalpha)
		
		})

		// draw frags
		part_coords.foreach_all(function(part) {
			var dx = x, dy = y
			with part
				draw_sprite_ext(sMainMenuFrameStart, image_index, dx + x, dy + y, 1, 1, 0, $ffffff, image_alpha)
		})

		break
	}

	default: {
		draw_sprite_ext(sMainMenuFrameStart, 25, x, y, 1, 1, 0, $ffffff, 1)

		break
	}
}
