var dx = screen_width * 0.5
var dy = screen_height + 200 - ui_alpha * 218
draw_set_alpha(ui_alpha)
draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(1)
if global.extreme
	draw_text_transformed(dx, dy, "EXTREME / " + string(global.stage + 1), 2, 2, 0)
else
	draw_text_transformed(dx, dy, "NORMAL / " + string(global.stage + 1), 2, 2, 0)

if instance_exists(gauge_target) {
	gauge_target_name = gauge_target.name
	gauge_target_ratio = gauge_target.hp / gauge_target.hp_max
}

if 0 < gauge_alpha {
	draw_set_alpha(gauge_alpha * ui_alpha)
	var gsiz = gauge_target_ratio * screen_width * 0.5 // ratio of the halfed screen
	var gcol1 = make_color_hsv(gauge_target_ratio * 40, 240, 96)
	var gcol2 = make_color_hsv(gauge_target_ratio * 85, 240, 96)

	var gdx = dx * 0.5
	draw_sprite_part_ext(sGauge, 0, gsiz, gauge_texloop_y, dx - gsiz, 12, gdx + gsiz, 880, 1, 1, gcol1, draw_get_alpha())
	draw_sprite_part_ext(sGauge, 0, gsiz, gauge_texloop_y + 4, dx - gsiz, 12, gdx + gsiz, 880, 1, 1, gcol1, draw_get_alpha())

	if gsiz != 0 {
		draw_sprite_part_ext(sGauge, 0, 0, gauge_texloop_y, gsiz, 12, gdx, 880, 1, 1, gcol2, draw_get_alpha())
		draw_sprite_part_ext(sGauge, 0, 0, gauge_texloop_y + 4, gsiz, 12, gdx, 880, 1, 1, gcol2, draw_get_alpha() * 0.5)
	}

	draw_set_halign(1)
	draw_set_valign(1)
	draw_text_transformed(dx, 887, gauge_target_name, 1, 1, 0)
	draw_set_alpha(1)
}

if 0 < shadow_alpha
	draw_sprite_ext(sScreenShadow, 0, 0, 0, 1, 1, 0, $ffffff, shadow_alpha * 2)

if 0 < pause_alpha {
	//draw_set_alpha(pause_alpha * 0.5)
	//draw_set_color(0)
	//draw_rectangle(0, 0, screen_width, screen_height, 0)
	draw_set_alpha(pause_alpha * 3)
	draw_set_color($ffffff)
	draw_set_halign(1)
	draw_set_valign(1)
	draw_text_transformed(screen_width * 0.5, 30 - (1 - ease_out_expo(pause_alpha)) * 100, "PAUSED", 3, 3, 0)
}

draw_set_alpha(1)
/*if global.player_fever_laser > 0 {
	gpu_set_blendmode_ext(bm_inv_dest_color,bm_inv_src_color)
	var division = min(1, global.player_fever_laser * 0.01)
	var dxf = screen_width - 40
	var dyf = screen_height - 10
	
	draw_set_color(make_color_hsv(0, 0, 128 + division * 127))
	draw_rectangle(dxf, dyf, dxf + 30, dyf - division * 200, 0)

	gpu_set_blendmode(bm_normal)
}
*/
draw_set_color($ffffff)
