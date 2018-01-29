/// @description Drawing trophy board

gpu_set_cullmode(cull_counterclockwise)
draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(0)
draw_set_alpha(1 - rpush[0])

draw_text_transformed(screen_width / 2, 110 - 80 * rpush[0], "ACHIEVEMENTS", 2, 2, 0)

var aalpha
for (var i = 0; i < global.achievement_count; ++i) {
	if archc[i] > 0
		aalpha = 1
	else
		aalpha = 0.5

	camera_projection_set(300, 0, 360, -50, 0, 0, 0, -1, 0, 42, 1.3, 12, 32000)
	draw_transform_set_rotation_y(20 - angle[i])
	draw_transform_add_translation(archx[i] + scroll, -50 - 60 * rpush[0] + lengthdir_y(4, rots), 80)
	draw_sprite_ext(sAchievement, i, 0, 0, 2, 2, 0, $ffffff, (1 - rpush[0]) * aalpha + (selected == i) / 2)
	draw_transform_set_identity()
	camera_projection_identity()

	if draw_mode == 0
		draw_set_alpha(alpha[i])
	else if alpha[i] < 1 - rpush[0]
		draw_set_alpha(1 - rpush[0])

	if selected == i {
		draw_transform_set_rotation_y(-45)
		draw_transform_add_translation(screen_width / 2 + scroll - selected * scroll_gab, 130 - 50 * rpush[0], 0)
		draw_text_transformed(0, 0, archn[i], 3, 3, 0)
		draw_transform_set_identity()
	}

	if selected == i {
		draw_set_alpha(1 - rpush[1])
		draw_text_transformed(screen_width / 2, 600 + 300 * rpush[1], archg[i], 2, 2, 0)
	}
}

draw_set_alpha(1)
gpu_set_cullmode(cull_noculling)
