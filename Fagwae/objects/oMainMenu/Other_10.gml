/// @description Declare the menu components
Menu()

function MainMenuProp(): MenuEntry() constructor {
	self.sprite_index = null
	self.__h = 74
}

with add_menu_item(new MainMenuProp()) {
	self.sprite_index = sMainMenuFrameStart
	self.__x = 441
	self.__y = 492
	self.__caption = "START"
	self.__inumber = 25

	self.shparts = function() constructor {
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
	self.part_coords = ffs

	self.do_update = function() {
		if __transition {
			
		} else {
			var i, ff, chx, chy, fdist, fdir
			for (i = 0; i < __inumber; ++i) {
				ff = part_coords[i]

				with ff {
					move_time += delta_time * 0.000001

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

	self.do_draw = function() {
		var i, ff
		for (i = 0; i < __inumber; ++i) {
			ff = part_coords[i]
			draw_sprite(sprite_index, i, __x + ff.x, __y + ff.y)
		}
	}

	add_text("On", 0, 0)
	
	focus()
}

/*
with add_text("Debug") {
	with add_text("Invincible") {
		add_text("On")
		add_text("Off")

		focus()
	}
	
	with add_text("Overpower") {
		add_text("On")
		add_text("Off")
	}

	with add_text("Infinite bombs") {
		add_text("On")
		add_text("Off")
	}

	add_text("Back")
}
with add_text("Setting") {
	add_text("Back")
}

with add_text("Exit") {
	add_text("Yes")
	with add_text("No") {
		focus()
	}

	set_callback(function() {
		focus_index(1)
	})
}*/

