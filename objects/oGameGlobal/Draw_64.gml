/// @description 

draw_set_alpha(1 - ipush)

var dx = global.screen_gui_cx
var dy = screen_height - 16 + ipush * 32

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(1)
if global.extreme
	draw_text_transformed(dx, dy, "EXTREME / " + string(global.stage), 2, 2, 0)
else
	draw_text_transformed(dx, dy, "NORMAL / " + string(global.stage), 2, 2, 0)

if instance_exists(global.gauge_target) {
	draw_set_alpha(global.gauge_alpha)
	var gratio = global.gauge_hp / global.gauge_hp_max
	var gsiz = gratio * screen_width * 0.5
	var gcol1 = make_color_hsv(gratio * 40, 240, 96)
	var gcol2 = make_color_hsv(gratio * 85, 240, 96)

	var gdx = dx * 0.5
	draw_sprite_part_ext(sGauge, 0, gsiz, gaugetexy, dx - gsiz, 12, gdx + gsiz, 880, 1, 1, gcol1, draw_get_alpha())
	draw_sprite_part_ext(sGauge, 0, gsiz, gaugetexy + 4, dx - gsiz, 12, gdx + gsiz, 880, 1, 1, gcol1, draw_get_alpha())

	if gsiz != 0 {
		draw_sprite_part_ext(sGauge, 0, 0, gaugetexy, gsiz, 12, gdx, 880, 1, 1, gcol2, draw_get_alpha())
		draw_sprite_part_ext(sGauge, 0, 0, gaugetexy + 4, gsiz, 12, gdx, 880, 1, 1, gcol2, draw_get_alpha() * 0.5)
	}

	draw_set_halign(1)
	draw_set_valign(1)
	draw_text_transformed(dx, 887, global.gauge_caption, 1, 1, 0)
	draw_set_alpha(1)
}

if shadow_alpha > 0
	draw_sprite_ext(sScreenShadow, 0, 0, 0, 1, 1, 0, $ffffff, shadow_alpha * 2)

if fade_alpha > 0 {
	//draw_set_alpha(fade_alpha * 0.5)
	//draw_set_color(0)
	//draw_rectangle(0, 0, screen_width, screen_height, 0)

	if global.screenlock {
		draw_set_alpha(fade_alpha * 3)
		draw_set_color($ffffff)
		draw_set_halign(1)
		draw_set_valign(1)
		draw_text_transformed(global.screen_gui_cx, 30 - (1 - ease_out_expo(fade_alpha)) * 100, "PAUSED", 3, 3, 0)
	}
}
draw_set_alpha(1)

if global.player_fever_laser > 0 {
	gpu_set_blendmode_ext(bm_inv_dest_color,bm_inv_src_color)
	var division = min(1, global.player_fever_laser * 0.01)
	var dxf = screen_width - 40
	var dyf = screen_height - 10
	
	draw_set_color(make_color_hsv(0, 0, 128 + division * 127))
	draw_rectangle(dxf, dyf, dxf + 30, dyf - division * 200, 0)

	gpu_set_blendmode(bm_normal)
}

draw_set_color($ffffff)