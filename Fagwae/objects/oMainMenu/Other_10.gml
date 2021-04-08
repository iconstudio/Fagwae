/// @description Declare the menu components
Menu()
set_open(true)

function MainMenuProp(): MenuEntry() constructor {
	this.sprite_index = null
	this.__h = 74
}

with add_menu_item(new MainMenuProp()) {
	this.sprite_index = sMainMenuFrameStart
	this.__x = 441
	this.__y = 492
	this.__caption = "START"
	this.__inumber = 25

	this.shparts = function() constructor {
		x = 0
		y = 0
		dx = 0
		dy = 0
		speed = 0.85 // pixel per second
		move_time = 2
		move_period_min = 0.7
		move_period_max = 1.4
	}

	var ffs = array_create(__inumber)
	for (var i = 0; i < __inumber; ++i)
		ffs[i] = new shparts()
	this.part_coords = ffs

	this.do_update = function() {
		if __transition {
			if __trans_mode == MENU_MODES.OPEN {
				var dalpha = __trans_time /__trans_period
			}
		} else {
			var i, ff, chx, chy, fdist, fdir
			for (i = 0; i < __inumber; ++i) {
				ff = part_coords[i]

				with ff {
					move_time += Delta

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
			}
		}
	}

	this.do_draw = function() {
		var i, ff

		for (i = 0; i < __inumber; ++i) {
			ff = part_coords[i]
			draw_sprite_ext(sprite_index, i, __x + ff.x, __y + ff.y, 1, 1, 0, $ffffff, 1)
		}
	}

	add_text("On", 0, 0)
	
	focus()
}
