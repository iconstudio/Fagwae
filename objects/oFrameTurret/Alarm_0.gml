/// @description 

alarm[0] = max(4, 17 - global.stage / 3)

if y >= screen_height - 200 || x < 8 || x > screen_height - 8
	exit

var inst = enemy_shot(x + lengthdir_x(22, shot_direction), y + lengthdir_y(22, shot_direction), 3, shot_direction)
inst.parent = parent
if instance_exists(parent) {
  inst.hspeed += parent.hspeed
  inst.vspeed += parent.vspeed
}
