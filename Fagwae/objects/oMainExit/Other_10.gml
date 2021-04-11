/// @description Create menu status
sub_state_normal = new menu_state() // do nothing
sub_state_normal.caption = "main-sub-start-normal"
sub_state_normal.set_initializer(function() {
	transitioning = false
})
sub_state_normal.set_drawer(draw_complete)

sub_state_exit = new menu_state()
sub_state_exit.caption = "main-sub-start-exit"

sub_state_close_2 = new menu_state()
sub_state_close_2.caption = "main-sub-start-close"
sub_state_close_2.set_duration(0.95)
sub_state_close_2.set_next(sub_state_normal)
sub_state_close_2.set_updater(function(progress) {
	var counts = min(ease.inout_quad(progress) * parts_number, parts_number)

	part_coords.foreach_n(0, counts, function(part) {
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
})
sub_state_close_2.set_callback(function() {
	part_coords.foreach_all(function(part) {
		part.flip_time = 0
		part.xangle = 0
		part.image_alpha = 1
	})
	shuffle_parts()
})
sub_state_close_2.set_drawer(draw_transition)

sub_state_close_1 = new menu_state()
sub_state_close_1.caption = "main-sub-start-close"
sub_state_close_1.set_duration(1.2)
sub_state_close_1.set_next(sub_state_close_2)
sub_state_close_1.set_updater(function(progress) {
	var counts = min(2 + ease.in_cubic(progress) * parts_number * 1.1, parts_number)

	part_coords.foreach_n(0, counts, function(part) {
		with part {
			var flip_ratio = min(1, flip_time / flip_period * 2)
			if flip_ratio < 1 {
				xangle = lerp(0, 90, ease.in_circ(flip_ratio))
				image_alpha = lerp(1, 0, (flip_ratio * 1.2))

				flip_time += Delta
			} else {
				xangle = 90
			}
		}
	})
})
sub_state_close_1.set_callback(function() {
	x = xstart
	y = ystart
	part_coords.foreach_all(function(part) {
		part.flip_time = 0
		part.image_alpha = 0
	})
	shuffle_parts()
})
sub_state_close_1.set_drawer(draw_transition)

sub_state_open_2 = new menu_state()
sub_state_open_2.caption = "main-sub-start-open-2"
sub_state_open_2.set_duration(1.2)
sub_state_open_2.set_next(sub_state_normal)
sub_state_open_2.set_updater(function(progress) {
	var counts = min(ease.inout_quad(progress) * parts_number, parts_number)

	part_coords.foreach_n(0, counts, function(part) {
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
})
sub_state_open_2.set_callback(function() {
	part_coords.foreach_all(function(part) {
		part.flip_time = 0
		part.xangle = 0
		part.image_alpha = 1
	})
	shuffle_parts()
})
sub_state_open_2.set_drawer(draw_transition)

sub_state_open_1 = new menu_state()
sub_state_open_1.caption = "main-sub-start-open-1"
sub_state_open_1.set_duration(0.95)
sub_state_open_1.set_next(sub_state_open_2)
sub_state_open_1.set_updater(function(progress) {
	var counts = min(2 + ease.inout_quad(progress) * parts_number * 1.5, parts_number)

	part_coords.foreach_n(0, counts, function(part) {
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
})
sub_state_open_1.set_callback(function() {
	part_coords.foreach_all(function(part) {
		part.flip_time = 0
		part.image_alpha = 0
	})
	x = tr_open_x
	y = tr_open_y
})
sub_state_open_1.set_drawer(draw_transition)

sub_state_intro = new menu_state()
sub_state_intro.caption = "main-sub-start-intro"
sub_state_intro.set_duration(2)
sub_state_intro.set_next(sub_state_normal)
sub_state_intro.set_updater(function(progress) {
	var intro_index = min(3 + ease.out_quart(progress) * parts_number, parts_number)

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
})
sub_state_intro.set_callback(function() {
	part_coords.foreach_all(function(part) { // debug
		part.image_alpha = 1
		part.y = 0
	})
	shuffle_parts()
})
sub_state_intro.set_drawer(function() {
	part_coords.foreach_all(function(part) {
		var oalpha = part.image_alpha, dalpha
		if oalpha < 0.5 {
			dalpha = oalpha * 1.6 // ~0.8
		} else {
			dalpha = 0.8 - oalpha * 2
		}

		var dx = x, dy = y
		with part
			draw_sprite_ext(sMainStartFrameIntro, image_index, dx + x, dy + y, 1, 1, 0, $ffffff, dalpha)
		
	})

	// draw frags
	draw_parts()
})

mode_enter = sub_state_intro
mode_exit = sub_state_exit
__callback_open = function() {
	menu_mode_change(sub_state_open_1)
}
__callback_close = function() {
	menu_mode_change(sub_state_close_1)
}

tr_open_x = view_wport * 0.5
tr_open_y = view_hport * 0.2
