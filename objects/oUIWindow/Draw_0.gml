
draw_set_color($ffffff)

var dx = x - ui_width * ui_anchor[0] - 15
var dy = y - ui_height * ui_anchor[1] - 15
ui_draw_sprite_panel(sWindowPanel, 0, 16, dx, dy, ui_width + 30, ui_height + 30)
