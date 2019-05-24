/// @description Attacking
alarm[0] = shot_period
if y >= screen_height - 200 or y < 10
	exit

var ax =  + lengthdir_x(22, shot_direction)
var ay =  + lengthdir_y(22, shot_direction)
var cx = x + lengthdir_x(9, shot_direction - 90) + ax
var cy = y + lengthdir_y(9, shot_direction - 90) + ay
var inst = enemy_shot(cx, cy, shot_speed, shot_direction)
inst.parent = parent
if instance_exists(parent) {
  inst.hspeed += parent.hspeed
  inst.vspeed += parent.vspeed
}
cx = x + lengthdir_x(9, shot_direction + 90) + ax
cy = y + lengthdir_y(9, shot_direction + 90) + ay
inst = enemy_shot(cx, cy, shot_speed, shot_direction)
inst.parent = parent
if instance_exists(parent) {
  inst.hspeed += parent.hspeed
  inst.vspeed += parent.vspeed
}

if !audio_is_playing(soundShotEnemy)
	enemy_play_shot()
