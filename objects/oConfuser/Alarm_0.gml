/// @description Attacking

var sx = x + lengthdir_x(20, image_angle)
var sy = y + lengthdir_y(20, image_angle)
enemy_shot(sx, sy, shot_speed, image_angle)
if global.extreme {
	enemy_shot(sx, sy, shot_speed, image_angle + 30)
	enemy_shot(sx, sy, shot_speed, image_angle - 30)
}
enemy_play_shot()

alarm[0] = max(14, 23 - global.stage * 0.5)
