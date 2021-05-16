/// @description Drawing the pause menu
draw_set_alpha(1)
draw_set_color($ffffff)

draw_set_font(fontPause)
draw_set_valign(2)

draw_set_halign(1)
//draw_text_transformed(title_x, title_y, "- " + global.area_title + " -", 2, 2, 0)
draw_text_transformed(title_x, title_y, "- paused -", 2, 2, 0)

draw_set_halign(0)
menus.enumerate_all(menu_drawer)
