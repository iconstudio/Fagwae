/// @description Attacking
var inst = enemy_shot(x + lengthdir_x(22, shot_direction), y + lengthdir_y(22, shot_direction), shot_speed, shot_direction)
inst.parent = parent
inst.hspeed += parent.hspeed
inst.vspeed += parent.vspeed
if !audio_is_playing(soundShotEnemy)
	enemy_play_shot()

