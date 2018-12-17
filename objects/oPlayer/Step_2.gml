/// @description Limitation, Outline

event_user(0)

if x < roomborder_left
	x = roomborder_left
if x >= roomborder_right
	x = roomborder_right
if y < roomborder_top
	y = roomborder_top
if y >= roomborder_bottom
	y = roomborder_bottom

global.px = x
global.py = y

out_rotation -= 17
if (out_rotation < 0)
 out_rotation += 360

draw_transform_set_translation(out_x + 1, out_y + 1, 0)
surface_set_target(out_surf)
draw_clear_alpha(background_color, 0)
draw_sprite_ext(sprite_index, 2, 0, 0, 1, 1, angle_player, $ffffff, 1)
draw_sprite_ext(sPlayerArm, 2, out_ax, 3 + out_ay, 1, 1, angle_arm + angle_player - cangle, $ffffff, 1)
draw_sprite_ext(sPlayerArm, 2, -out_ax, 3 - out_ay, 1, 1, angle_arm + angle_player + cangle, $ffffff, 1)
surface_reset_target()
draw_transform_set_identity()
