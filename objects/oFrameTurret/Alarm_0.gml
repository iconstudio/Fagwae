/// @description Attacking
if !instance_exists(parent) or y >= screen_height - 200 or x < 8 or x > screen_height - 8 or y < 10
	exit

var inst = enemy_shot(x + lengthdir_x(22, shot_direction), y + lengthdir_y(22, shot_direction), 3, shot_direction)
inst.parent = parent
inst.hspeed += parent.hspeed
inst.vspeed += parent.vspeed
if !audio_is_playing(soundShotEnemy)
	enemy_play_shot()

alarm[0] = shot_period
