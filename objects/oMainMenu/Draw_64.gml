/// @description Drawing

draw_set_color($ffffff)

draw_set_alpha((1 - push[0]) / 1 * get_ralpha(flash[0]))

draw_set_alpha((1 - push[1]) / 1 * get_ralpha(flash[1]))

aalpha = max((1 - push[2]) / 1 * get_ralpha(flash[2]), 0)
if aalpha <= 0
	exit


draw_set_alpha(aalpha)
draw_set_color($ffffff)
draw_set_halign(1)
draw_text_transformed(screen_width * 0.5, screen_height - 20 + push[1] * 60, global.status_name, 2, 2, 0)
