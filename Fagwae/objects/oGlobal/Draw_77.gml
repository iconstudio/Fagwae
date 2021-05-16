/// @description Drawing the screen
if !surface_exists(surf)
	event_user(0)


surface_set_target(surf)
gpu_set_blendenable(false)
gpu_set_blendmode_ext(bm_one, bm_zero)
draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
gpu_set_blendmode(bm_normal)
gpu_set_blendenable(true)
surface_reset_target()


if 0 < shake_time and 0 < shake_meter {
	speed = random(shake_meter)
	direction += random(80) + 140

	var xo = shake_xn, yo = shake_yn
	shake_xn = hspeed * 0.7
	shake_yn = vspeed * 0.7

	gpu_set_blendmode(bm_add)
	for (var i = 1; i <= shake_level; ++i) {
		draw_surface_ext(application_surface, xo + (shake_xn - xo) * shake_pico * i, yo + (shake_yn - yo) * shake_pico * i, 1, 1, 0, $ffffff, shake_pico)
	}
	gpu_set_blendmode(bm_normal)

	shake_time -= Delta
} else {
	draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
}
