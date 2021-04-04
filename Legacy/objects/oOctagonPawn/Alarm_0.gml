/// @description Attacking
if y >= 800 or shot_phase != 0
	exit

enemy_shot(x, y, shot_speed, point_direction(x, y, global.px, global.py))
enemy_play_shot()

if shot_count++ == 0 {
	alarm[0] = shot_period
} else if shot_count < 2 + global.extreme + floor(global.stage * 0.333) {
	alarm[0] = shot_period_continue
} else {
	shot_count = 0
	alarm[0] = shot_period_reset
}
