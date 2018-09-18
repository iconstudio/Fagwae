/// @description Drawing screen

if !surface_exists(surf)
	event_user(0)

if !global.screenlock {
	event_user(4)
} else {
	if sprite_exists(capture) {
		surface_set_target(surf)
		draw_sprite(capture, 0, 0, 0)
		surface_reset_target()
	}
}
if fxaa_on
	shader_reset()

gpu_set_blendenable(false)
//shader_set_uniform_f(shaderHQ_tex, view_width, view_height)
gpu_set_blendmode_ext(bm_one, bm_zero)
draw_surface_ext(surf, 0, 0, 1, 1, 0, $ffffff, 1)
gpu_set_blendmode(bm_normal)
gpu_set_blendenable(true)

if global.screenshake > 0 {
	speed = global.screenshake
	direction = (direction + random(80) + 140) mod 360
	camera_set_view_pos(view_camera, hspeed, vspeed)

	xo = xn
	yo = yn
	xn = hspeed
	yn = vspeed
	for (var i = 1; i <= shakelevel; ++i)
		draw_surface_ext(surf, xo + (xn - xo) / shakelevel * i, yo + (yn - yo) / shakelevel * i, 1, 1, 0, $ffffff, 1 / shakelevel)
	global.screenshake -= global.screenshake * 0.1
} else {
	camera_set_view_pos(view_camera, 0, 0)
}
