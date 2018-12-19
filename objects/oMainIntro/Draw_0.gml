/// @description Drawing
draw_set_color($ffffff)
var push_first = slide_time / slide_period
var push_second_before = zoom_before_time / zoom_before_period
var push_second = zoom_time / zoom_period
var push_third = centering_time / centering_period

if intro_mode == 0 {
	var idx = slide_dx + slide_exceed_fill * ease_in_cubic(1 - push_first)
	draw_sprite_ext(sTitle, 1, idx, title_yposition, intro_subsize, intro_subsize, 0, $ffffff, 1)
} else if intro_mode == 1 {
	draw_sprite_ext(sTitle, 1, slide_dx + slide_exceed * push_second_before, title_yposition, intro_subsize, intro_subsize, 0, $ffffff, 1)
} else if intro_mode == 2 {
	draw_sprite_ext(sTitle, 1, room_width * 0.5, title_yposition, 1, 1, 0, $ffffff, 1)
}

if intro_mode > 0 {
	draw_primitive_begin_texture(pr_trianglestrip, title_texture)
	draw_set_alpha(power(push_third, 5))
	var iax = 100 * ease_out_expo(1 - push_second)
	var iay = 50 * (1 - push_third)
	draw_vertex_texture(title_pos_tleft - iax, title_pos_top + iay, 0, 0)
	draw_vertex_texture(title_pos_tright + iax, title_pos_top + iay, 1, 0)
	draw_vertex_texture(title_pos_bright + iax, title_pos_bottom - iay, 1, 1)
	draw_vertex_texture(title_pos_tleft - iax, title_pos_top + iay, 0, 0)
	draw_vertex_texture(title_pos_bleft - iax, title_pos_bottom - iay, 0, 1)
	draw_vertex_texture(title_pos_bright + iax, title_pos_bottom - iay, 1, 1)
	draw_primitive_end()
}
