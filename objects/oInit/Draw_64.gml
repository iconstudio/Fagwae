/// @description Loading

rotation = (rotation + 2) mod 360

draw_sprite_ext(sLoading, 0,view_width * 0.5, view_height * 0.5, 0.6, 0.6, -rotation, $ffffff, 1)

draw_set_font(fontNormal)
draw_text(view_width * 0.5, view_height * 0.8, "Loading ...")
draw_set_font(fontRetro)
