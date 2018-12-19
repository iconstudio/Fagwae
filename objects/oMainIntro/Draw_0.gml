/// @description Drawing
var pushzero = 1 - push[0]
draw_set_alpha(pushzero * get_ralpha(flash[0]))
draw_set_color($ffffff)

if intro_mode == 0 {
	var idx = room_width * 0.5 + 700 - 1000 * ease_in_cubic(intro_push[0])
	draw_sprite_ext(sTitle, 1, idx, title_yposition, intro_projscale, intro_projscale, 0, $ffffff, 1)
} else if intro_mode == 1 {
	draw_sprite_ext(sTitle, 1, room_width * 0.5 - 300 + 300 * intro_push[1], title_yposition, intro_projscale, intro_projscale, 0, $ffffff, 1)
} else if intro_mode == 2 {
	draw_sprite_ext(sTitle, 1, room_width * 0.5, title_yposition, 1, 1, 0, $ffffff, 1)
}

if intro_mode != 0 and intro_push[2] > 0.04 {
	draw_primitive_begin_texture(pr_trianglestrip, title_texture)
	draw_set_alpha(power(intro_push[2], 5) + intro_push[1] * 0.1)
	var iax = 100 * (1 - title_push)
	var iay = 50 * (1 - intro_push[2])
	draw_vertex_texture(title_pos_tleft - iax, title_pos_top + iay, 0, 0)
	draw_vertex_texture(title_pos_tright + iax, title_pos_top + iay, 1, 0)
	draw_vertex_texture(title_pos_bright + iax, title_pos_bottom - iay, 1, 1)
	draw_vertex_texture(title_pos_tleft - iax, title_pos_top + iay, 0, 0)
	draw_vertex_texture(title_pos_bleft - iax, title_pos_bottom - iay, 0, 1)
	draw_vertex_texture(title_pos_bright + iax, title_pos_bottom - iay, 1, 1)
	draw_primitive_end()
}
