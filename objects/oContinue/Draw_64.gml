/// @description 

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(1)
draw_set_alpha(rpush[0])
draw_text_transformed(global.screen_gui_cx, screen_height * 0.5 - (1 - rpush[0]) * 500, "CONTINUE?", 2, 2, 0)
draw_set_alpha(rpush[1] * (0.5 + (selected == 0) * 0.5))
draw_text_transformed(global.screen_gui_cx, screen_height * 0.6, "YES", 2, 2, 0)
draw_set_alpha(rpush[2] * (0.5 + (selected == 1) * 0.5))
draw_text_transformed(global.screen_gui_cx, screen_height * 0.6 + 20, "NO", 2, 2, 0)
draw_set_alpha(1)
