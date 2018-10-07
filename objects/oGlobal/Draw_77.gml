/// @description Drawing screen

if !surface_exists(surf)
	event_user(0)

surface_set_target(surf)
surface_reset_target()

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

if global.screenshake > 0 {
	speed = global.screenshake
	direction = (direction + random(80) + 140) mod 360
	camera_set_view_pos(view_camera, hspeed, vspeed)

	xo = xn
	yo = yn
	xn = hspeed
	yn = vspeed
	gpu_set_blendmode(bm_add)
	for (var i = 1; i <= shakelevel; ++i)
		draw_surface_ext(surf, xo + (xn - xo) / shakelevel * i, yo + (yn - yo) / shakelevel * i, 1, 1, 0, $ffffff, 1 / shakelevel)
	gpu_set_blendmode(bm_normal)

	global.screenshake -= global.screenshake * 0.1
} else {
	camera_set_view_pos(view_camera, 0, 0)

	xo = 0
	yo = 0
	draw_surface_ext(surf, 0, 0, 1, 1, 0, $ffffff, 1)
}
/* 
if global.screenlock and ds_priority_size(global.ui_listbox) > 0 {
	ds_priority_copy(global.ui_listbox, ui_listbox_copy)

	var ui_instance
	while !ds_priority_empty(ui_listbox_copy) {
		ui_instance = ds_priority_delete_max(ui_listbox_copy)
		if instance_exists(ui_instance) {
			show_debug_message("drawing: " + object_get_name(ui_instance.object_index))
			with ui_instance
				event_perform(ev_draw, 0)
		}
	}
}
