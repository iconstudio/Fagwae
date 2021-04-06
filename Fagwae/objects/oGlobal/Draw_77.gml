/// @description Drawing the screen
if !surface_exists(surf)
	event_user(0)

if global.screenlock {
	if sprite_exists(capture) {
		draw_sprite(capture, 0, 0, 0)
	}
} else {
	surface_set_target(surf)
	gpu_set_blendenable(false)
	gpu_set_blendmode_ext(bm_one, bm_zero)
	draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
	gpu_set_blendmode(bm_normal)
	gpu_set_blendenable(true)
	surface_reset_target()

	if 0 < shake_time {
		speed = shake_meter * (shake_time-- / shake_period)
		direction = (direction + random(80) + 140) mod 360
		xo = xn
		yo = yn
		xn = hspeed * 0.7
		yn = vspeed * 0.7

		gpu_set_blendmode(bm_add)
		for (var i = 1; i <= shake_level; ++i)
			draw_surface_ext(application_surface, xo + (xn - xo) / shake_level * i, yo + (yn - yo) / shake_level * i, 1, 1, 0, $ffffff, 1 / shake_level)
		gpu_set_blendmode(bm_normal)
	} else {
		xo = 0
		yo = 0
		draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
	}
}
