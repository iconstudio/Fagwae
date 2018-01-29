/// @description Drawing screen

if !surface_exists(surf)
 event_user(0)

if !global.screenlock {
 surface_set_target(surf)
 draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
 surface_reset_target()
}

if fade_current < fade_target {
	fade_alpha = script_execute(fade_easer, fade_current)
	fade_current += 0.01
} else {
	fade_current = fade_target
	fade_alpha = fade_current
}

gpu_set_blendmode_ext(bm_one, bm_zero)
draw_surface_ext(surf, 0, 0, 1, 1, 0, $ffffff, 1)
gpu_set_blendmode(bm_normal)

if fade_alpha > 0 {
	draw_set_alpha(fade_alpha)
	draw_set_color(0)
	draw_rectangle(0, 0, view_width, view_height, 0)
	draw_set_alpha(1)
}

if global.screenshake {
	speed = global.screenshake
	direction = (direction + random(80) + 140) mod 360
	camera_set_view_pos(view_camera, hspeed, vspeed)

	xo = xn
	yo = yn
	xn = hspeed
	yn = vspeed
	for (var i = 1; i <= shakelevel; ++i)
		draw_surface_ext(surf, xo + (xn - xo) / shakelevel * i, yo + (yn - yo) / shakelevel * i, 1, 1, 0, $ffffff, 1 / shakelevel)
	global.screenshake -= global.screenshake / 10
} else {
	camera_set_view_pos(view_camera, 0, 0)
}
