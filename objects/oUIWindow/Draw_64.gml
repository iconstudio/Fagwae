
var dx = x - ui_width * ui_anchor[0] - 15
var dy = y - ui_height * ui_anchor[1] - 15
draw_set_alpha(image_alpha)
draw_set_color($ffffff)
ui_draw_sprite_panel(sprite_index, 0, 16, dx, dy, ui_width + 30, ui_height + 30)
