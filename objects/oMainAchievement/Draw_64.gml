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

	camera_projection_set(500, 0, 500, 0, 0, 0, 0, -1, 0, 45, 4 / 3, 32, 32000)
	draw_transform_set_rotation_y(15 - angle[i])
	draw_transform_add_translation(archx[i] + scroll, -40 - 60 * rpush[0] + lengthdir_y(15, rots), 0)
	draw_sprite_ext(sAchievement, i, 0, 0, 2, 2, 0, $ffffff, (1 - rpush[0]) * aalpha + (selected == i) / 2)
	draw_transform_set_identity()

	if dmode == 0
		draw_set_alpha(alpha[i])
	else if alpha[i] < 1 - rpush[0]
		draw_set_alpha(1 - rpush[0])

	if selected == i
		draw_text_transformed(archx[i] + scroll, 40 - 50 * rpush[0], archn[i], 3, 3, 0)

	camera_projection_identity()
	if selected == i {
		draw_set_alpha(1 - rpush[1])
		draw_text_transformed(320, 340 + 60 * rpush[1], archg[i], 2, 2, 0)
	}
}

draw_set_alpha(1)
