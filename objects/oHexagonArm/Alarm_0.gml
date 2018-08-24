/// @description 

if y < 500 {
	enemy_shot(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), 3, image_angle)
	audio_play_sound(soundShotEnemy, 0, false)

	if global.extreme
		alarm[0] = max(1, 8 - global.stage * 0.333)
	else
		alarm[0] = max(1, 18 - global.stage * 1.8)
}
