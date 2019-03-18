/// @description Drawing achievement board
draw_set_color($ffffff)
draw_set_halign(0)
draw_set_valign(0)
var alpha_base = (appear_time / appear_period) * (ease_in_expo(1 - disappear_time / disappear_period)), aalpha, dy = content_draw_y_start - scroll + 1, cy
for (var i = 0; i < global.achievement_count; ++i) {
	cy = i * item_height
	if scroll > cy + item_height - 1 {
		dy += item_height
		continue
	} else if cy > scroll + content_height {
		break
	}

	if global.achievement_cleared[i]
		aalpha = 1
	else
		aalpha = 0.5
	aalpha *= item_time[i] / item_period

	draw_set_alpha(aalpha * alpha_base)
	draw_text_transformed(content_draw_x_start, dy, global.achievement_caption[i], 2, 2, 0)
	draw_set_alpha(aalpha * alpha_base * 1.2)
	draw_text_transformed(content_draw_x_start, dy + 30, global.achievement_description[i], 1.75, 1.75, 0)
	dy += item_height
}
draw_set_alpha(1)
draw_set_color($0)
draw_rectangle(0, 0, screen_width, content_draw_y_start, false)
draw_rectangle(0, content_draw_y_end, screen_width, screen_height, false)

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_alpha(alpha_base * 2)
draw_text_transformed(screen_width * 0.5, 20 * alpha_base, "ACHIEVEMENTS", 2, 2, 0)
