/// @description Drawing player
var dx = round(x)
var dy = round(y)
var dcol, i

if !surface_exists(out_surf)
	event_user(2)

draw_transform_set_translation(out_x + 1, out_y + 1, 0)
surface_set_target(out_surf)
draw_clear_alpha(background_color, 0)
draw_sprite_ext(sprite_index, 2, 0, 0, 1, 1, angle_player, $ffffff, 1)
draw_sprite_ext(sPlayerArm, 2, out_ax, 3 + out_ay, 1, 1, angle_player - angle_arm_right, $ffffff, 1)
draw_sprite_ext(sPlayerArm, 2, -out_ax, 3 - out_ay, 1, 1, angle_player + angle_arm_left, $ffffff, 1)
surface_reset_target()
draw_transform_set_identity()

if hp > 0 {
	dcol = make_color_hsv(hp * 25 - 15, 216, 255)
	for (i = 0; i < out_surfh; i += 2)
		draw_surface_part_ext(out_surf, 0, i, out_surfw, 2, dx - out_x - 1, dy - out_y + i, 1, -1, dcol, 0.5 + lengthdir_x(0.4, out_rotation + i * 7))
}

draw_sprite_ext(sprite_index, 0, dx, dy, 1, 1, angle_player, $ffffff, 1)
draw_sprite_ext(sPlayerArm, 0, dx + out_ax, dy + 3 + out_ay, 1, 1, angle_player - angle_arm_right, $ffffff, 1)
draw_sprite_ext(sPlayerArm, 0, dx - out_ax, dy + 3 - out_ay, 1, 1, angle_player + angle_arm_left, $ffffff, 1)

if hp > 0 {
	dcol = make_color_hsv(hp * 25 - 15, 216, 255)
	for (i = 0; i < out_surfh; i += 2)
		draw_surface_part_ext(out_surf, 0, i, out_surfw, 2, dx - out_x - 1, dy - out_y + i, 1, -1, dcol, 0.2 + lengthdir_x(0.2, out_rotation * 0.333 + i * 7))
}

if slow
	draw_sprite_ext(sprite_index, 3, dx, dy, 1, 1, angle_player, $ffffff, 1)
