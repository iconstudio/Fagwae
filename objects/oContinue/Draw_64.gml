/// @description 

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(1)
draw_text_transformed(global.screen_gui_cx, global.screen_gui_cy - rpush[0] * 500, "CONTINUE?", 2, 2, 0)
draw_set_alpha(0.5 + (selected == 0) * 0.5)
draw_text_transformed(global.screen_gui_cx - rpush[1] * 400, global.screen_gui_cy, "YES", 2, 2, 0)
draw_set_alpha(0.5 + (selected == 1) * 0.5)
draw_text_transformed(global.screen_gui_cx - rpush[2] * 400, global.screen_gui_cy, "NO", 2, 2, 0)
draw_set_alpha(1)
