/// @description Shooting spread
var sspd
if global.extreme
	sspd = 1.2 + shot_count * 0.25 + global.stage * 0.125
else
	sspd = 2 + shot_count * 0.5 + global.stage * 0.167
enemy_shot(x, y, sspd, point_direction(x, y, global.px, global.py) + lengthdir_x(28, (shot_count + shot_rotation) * 12.7))
enemy_shot(x, y, sspd, point_direction(x, y, global.px, global.py) + lengthdir_y(28, (shot_count + shot_rotation) * 21.9))
enemy_play_shot()

shot_count++
if shot_count < 11 + global.stage * 0.5 + global.extreme * 10 {
	alarm[0] = shot_period
} else {
	alarm[1] = shot_period_continue
	shot_mode = 1
}
