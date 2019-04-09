/// @description Shooting spread
var attack_speed = shot_speed + shot_count * 0.09, attack_direction = point_direction(x, y, global.px, global.py)
enemy_shot(x, y, attack_speed, attack_direction + lengthdir_x(28, (shot_count + shot_rotation) * 12.7))
enemy_shot(x, y, attack_speed, attack_direction + lengthdir_y(28, (shot_count + shot_rotation) * 21.9))
enemy_play_shot()

shot_count++
if shot_count < 11 + global.stage * 0.5 + global.extreme * 10 {
	alarm[0] = shot_period
} else {
	alarm[1] = shot_period_continue
	shot_mode = 1
}
