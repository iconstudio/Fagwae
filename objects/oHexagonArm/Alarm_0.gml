/// @description Attacking
if y < room_height * 0.6 {
	enemy_shot(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), 3, image_angle)
	enemy_play_shot()

	alarm[0] = shot_period
}
