/// @description Drawing
var pushzero = 1 - push[0]
draw_set_alpha(pushzero * get_ralpha(flash[0]))
draw_set_color($ffffff)
with oMainOptionButton
	image_alpha = draw_get_alpha()

draw_sprite_ext(sTitle, 1, room_width * 0.5, title_yposition, 1, 1, 0, $ffffff, draw_get_alpha())
draw_primitive_begin_texture(pr_trianglestrip, title_texture)
draw_vertex_texture(title_pos_tleft * title_push, title_pos_top, 0, 0)
draw_vertex_texture(title_pos_tright * title_push, title_pos_top, 1, 0)
draw_vertex_texture(title_pos_bright * title_push, title_pos_bottom, 1, 1)
draw_vertex_texture(title_pos_tleft * title_push, title_pos_top, 0, 0)
draw_vertex_texture(title_pos_bleft * title_push, title_pos_bottom, 0, 1)
draw_vertex_texture(title_pos_bright * title_push, title_pos_bottom, 1, 1)
draw_primitive_end()

aalpha = max((1 - push[2]) * get_ralpha(flash[2]), 0)
draw_set_alpha(aalpha)
draw_set_halign(1)
draw_set_valign(1)
with oMainStartButton
	image_alpha = draw_get_alpha()

draw_set_alpha((1 - push[1]) * get_ralpha(flash[1]))

if global.log_highscore_1 > 0 {
	var scorer = string(global.log_highscore_1)
	if global.log_highscore_2 > 0
		scorer += " / " + string(global.log_highscore_2)
	draw_text_transformed(room_width * 0.5, room_height - (1 - push[1]) * 16, scorer, 2, 2, 0)
} else { // No score, beginner
	draw_text_transformed(room_width * 0.5, room_height - (1 - push[1]) * 16, "NO RANK", 2, 2, 0)
}
//draw_text_transformed(room_width * 0.5, room_height - (1 - push[1]) * 16, global.status_name, 2, 2, 0)
