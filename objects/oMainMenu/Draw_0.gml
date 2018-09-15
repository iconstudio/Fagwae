/// @description Drawing

var pushzero = 1 - push[0]
draw_set_alpha(pushzero * get_ralpha(flash[0]))
with oUISettingButton
	image_alpha = draw_get_alpha()

if !intro_clear
	draw_set_alpha(1)
if intro {
	if intro_mode == 0 {
		var idx = view_width * 0.5 + 700 - 1000 * ease_in_cubic(intro_push[0])
		draw_sprite_ext(sTitle, 1, idx, title_pos_proj, intro_projscale, intro_projscale, 0, $ffffff, 1)
	} else if intro_mode == 1 {
		draw_sprite_ext(sTitle, 1, view_width * 0.5 - 300 + 300 * intro_push[1], title_pos_proj, intro_projscale, intro_projscale, 0, $ffffff, 1)
	} else if intro_mode == 2 {
		draw_sprite_ext(sTitle, 1, view_width * 0.5, title_pos_proj, 1, 1, 0, $ffffff, 1)
	}
} else {
	draw_sprite_ext(sTitle, 1, view_width * 0.5, title_pos_proj, 1, 1, 0, $ffffff, draw_get_alpha())
}
// This is not white.
draw_primitive_begin_texture(pr_trianglestrip, title_texture_proj)
if !intro {
	draw_vertex_texture(title_pos_tleft * title_push, title_pos_top, 0, 0)
	draw_vertex_texture(title_pos_tright * title_push, title_pos_top, 1, 0)
	draw_vertex_texture(title_pos_bright * title_push, title_pos_bottom, 1, 1)
	draw_vertex_texture(title_pos_tleft * title_push, title_pos_top, 0, 0)
	draw_vertex_texture(title_pos_bleft * title_push, title_pos_bottom, 0, 1)
	draw_vertex_texture(title_pos_bright * title_push, title_pos_bottom, 1, 1)
} else if intro_mode != 0 and intro_push[2] > 0.04 {
	draw_set_alpha(power(intro_push[2], 5) + intro_push[1] * 0.1)
	var iax = 100 * (1 - title_push)
	var iay = 50 * (1 - intro_push[2])
	draw_vertex_texture(title_pos_tleft - iax, title_pos_top + iay, 0, 0)
	draw_vertex_texture(title_pos_tright + iax, title_pos_top + iay, 1, 0)
	draw_vertex_texture(title_pos_bright + iax, title_pos_bottom - iay, 1, 1)
	draw_vertex_texture(title_pos_tleft - iax, title_pos_top + iay, 0, 0)
	draw_vertex_texture(title_pos_bleft - iax, title_pos_bottom - iay, 0, 1)
	draw_vertex_texture(title_pos_bright + iax, title_pos_bottom - iay, 1, 1)
}
draw_primitive_end()

aalpha = max((1 - push[2]) * get_ralpha(flash[2]), 0)
draw_set_alpha(aalpha)
draw_set_color($ffffff)


draw_set_alpha((1 - push[1]) * get_ralpha(flash[1]))
draw_set_halign(1)
draw_text_transformed(view_width * 0.5, (1 - push[1]) * 16, global.status_name, 2, 2, 0)
