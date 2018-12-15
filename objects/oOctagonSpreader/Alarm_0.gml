/// @description Shooting spread

var sspd
if global.extreme
	sspd = 1.2 + shot_count * 0.25 + global.stage * 0.125
else
	sspd = 2 + shot_count * 0.5 + global.stage / 6
enemy_shot(x, y, sspd, point_direction(x, y, global.px, global.py) + lengthdir_x(28, (shot_count + pangle) * 12.7))
enemy_shot(x, y, sspd, point_direction(x, y, global.px, global.py) + lengthdir_y(28, (shot_count + pangle) * 21.9))
enemy_play_shot()

shot_count += 1
if shot_count < 11 + global.stage * 0.5 + global.extreme * 10 {
	alarm[0] = max(1, 5 - global.stage * 0.25 - global.extreme * 2)
} else {
	alarm[1] = max(1, 46 - global.stage * 0.5 - global.extreme * 2)
	shot_mode = 1
}
