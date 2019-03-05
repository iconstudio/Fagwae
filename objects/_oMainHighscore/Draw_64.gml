/// @description Drawing trophy board

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(0)
draw_set_alpha(1 - rpush[0])

camera_projection_identity()
draw_text_transformed(global.screen_gui_cx, 110 - 80 * rpush[0], "ACHIEVEMENTS", 2, 2, 0)

var aalpha
for (var i = 0; i < global.achievement_count; ++i) {
	if global.achievement_cleared[i]
		aalpha = 1
	else
		aalpha = 0.5

	menu_projection(300, 20, 360, 0, 0, 0, 0, -1, 0, 42, 1.3, 1, 32000)
	draw_transform_set_rotation_y(20 - angle[i])
	draw_transform_add_translation(archx[i] + scroll, -50 - 60 * rpush[0] + lengthdir_y(4, rots), 80)
	draw_sprite_ext(sAchievement, i, 0, 0, 2, 2, 0, $ffffff, (1 - rpush[0]) * aalpha + (selected == i) * 0.5)
	camera_projection_identity()

	if draw_mode == 0
		draw_set_alpha(alpha[i])
	else if alpha[i] < 1 - rpush[0]
		draw_set_alpha(1 - rpush[0])

	if selected == i {
		camera_projection_identity()
		draw_transform_set_translation(global.screen_gui_cx + scroll - selected * scroll_gab, 130 - 50 * rpush[0], 0)
		draw_text_transformed(0, 0, global.achievement_caption[i], 3, 3, 0)
		draw_set_alpha(1 - rpush[1])
		draw_text_transformed(0, global.screen_gui_cy * 1.5 + 300 * rpush[1], global.achievement_description[i], 2, 2, 0)
	}
	draw_transform_set_identity()
}

draw_set_alpha(1)
