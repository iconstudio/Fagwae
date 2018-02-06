/// @description 

draw_set_alpha(1 - ipush)

var dx = screen_width / 2
var dy = screen_height - 8 + ipush * 16

if global.player_fever_laser > 0 {
	var division = global.player_fever_laser / 100
	draw_set_color(make_color_hsv(30, (1 - division) * 255, 64 + division * 127 + lengthdir_y(64, gaugerots)))
	draw_rectangle(10, dy - 2, 26, dy - 2 - division * 20, 0)
}

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(1)
if global.extreme
	draw_text_transformed(dx, dy, "EXTREME / " + string(global.stage), 1, 1, 0)
else
	draw_text_transformed(dx, dy, "NORMAL / " + string(global.stage), 1, 1, 0)

if !instance_exists(global.gauge_target)
	exit

draw_set_alpha(global.gauge_alpha)
var gratio = global.gauge_hp / global.gauge_hp_max
var gsiz = gratio * screen_width * 0.5
var gcol1 = make_color_hsv(gratio * 40, 240, 96)
var gcol2 = make_color_hsv(gratio * 85, 240, 96)

draw_sprite_part_ext(sGauge, 0, gsiz, gaugetexy, dx - gsiz, 12, 160 + gsiz, 742, 1, 1, gcol1, draw_get_alpha())
draw_sprite_part_ext(sGauge, 0, gsiz, gaugetexy + 4, dx - gsiz, 12, 160 + gsiz, 742, 1, 1, gcol1, draw_get_alpha())

if gsiz != 0 {
	draw_sprite_part_ext(sGauge, 0, 0, gaugetexy, gsiz, 12, 160, 742, 1, 1, gcol2, draw_get_alpha())
	draw_sprite_part_ext(sGauge, 0, 0, gaugetexy + 4, gsiz, 12, 160, 742, 1, 1, gcol2, draw_get_alpha() * 0.5)
}

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(0)
draw_text_transformed(dx, 745, global.gauge_caption, 2, 2, 0)

if global.paused {
	draw_set_valign(1)
	draw_set_alpha(0.5)
	draw_set_color(0)
	
	draw_set_alpha(1)
	draw_set_color($ffffff)
	draw_text_transformed(global.screen_gui_cx, global.screen_gui_cy - 20, "PAUSED", 3, 3, 0)
	draw_text_transformed(global.screen_gui_cx, global.screen_gui_cy + 10, "PRESS ESC TO GO TO MAIN MENU", 2, 2, 0)
} else {
	draw_set_alpha(1)
}
