/// @description Drawing trophy board

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(0)
draw_set_alpha(1 - rpush[0])

draw_text_transformed(225, 20 - 80 * rpush[0], "ACHIVEMENTS", 2, 2, 0)

var aalpha
for (var i = 0; i < global.achievement_count; ++i) {
	if archc[i] > 0
		aalpha = 1
	else
		aalpha = 0.5

	camera_projection_set(300, 0, 400, -50, 0, 0, 0, -1, 0, 50 - selected * 2, 1.3, 12, 32000)
	draw_transform_set_rotation_y(30 - angle[i])
	draw_transform_add_translation(archx[i] + scroll, -50 - 60 * rpush[0] + lengthdir_y(10, rots), 0)
	draw_sprite_ext(sAchievement, i, 0, 0, 2, 2, 0, $ffffff, (1 - rpush[0]) * aalpha + (selected == i) / 2)
	draw_transform_set_identity()
	camera_projection_identity()

	if dmode == 0
		draw_set_alpha(alpha[i])
	else if alpha[i] < 1 - rpush[0]
		draw_set_alpha(1 - rpush[0])

	if selected == i {
		draw_transform_set_rotation_y(-45)
		draw_transform_add_translation(global.screen_gui_cx + scroll - selected * scroll_gab, 130 - 50 * rpush[0], 0)
		draw_text_transformed(0, 0, archn[i], 3, 3, 0)
		draw_transform_set_identity()
	}

	if selected == i {
		draw_set_alpha(1 - rpush[1])
		draw_text_transformed(global.screen_gui_cx, 740 + 100 * rpush[1], archg[i], 2, 2, 0)
	}
}

draw_set_alpha(1)
