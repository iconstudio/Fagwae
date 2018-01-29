/// @description Covering over all GUIs and objects

draw_set_color(0)
draw_set_alpha(image_alpha)
draw_rectangle(0, 0, screen_width, screen_height, 0)
draw_sprite_ext(sGameOver, 0, global.screen_gui_cx, global.screen_gui_cy, 1, 1, 0, $ffffff, ualpha)
draw_set_alpha(1)