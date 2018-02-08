/// @description 

if y < 500 {
	enemy_shot(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), 3, image_angle)

	if global.extreme
		alarm[0] = max(1, 8 - global.stage / 3)
	else
		alarm[0] = max(1, 18 - global.stage * 1.8)
}
