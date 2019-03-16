/// @description Update
event_inherited()

if y < global.py - 16
	gravity_direction = min(max(240, gravity_direction + get_rotation_next(gravity_direction, point_direction(x, y, global.px, global.py), 2)), 300)
if vspeed > 2
	vspeed = 2

arm_wiggle += 5

var _speed = speed, _direction = direction
for (var i = 0; i < arm_number; ++i) {
	speed = arm_width
	if instance_exists(arm_instances[i]) {
		direction = arm_angle[i] + image_angle + lengthdir_x(20, arm_wiggle)
		arm_instances[i].x = x + hspeed
		arm_instances[i].y = y + vspeed
		arm_instances[i].image_angle += (direction - arm_instances[i].image_angle) * 0.6
		
		var arm_second = arm_instances[i].arm_instance
		if instance_exists(arm_second) {
			arm_instances[i].speed = arm_instances[i].arm_width
			arm_instances[i].direction = arm_instances[i].image_angle
			var __speed = arm_instances[i].speed, __direction = arm_instances[i].image_angle
			arm_second.x = arm_instances[i].x + arm_instances[i].hspeed
			arm_second.y = arm_instances[i].y + arm_instances[i].vspeed
			arm_second.image_angle += (arm_instances[i].image_angle + lengthdir_x(15, arm_wiggle) - arm_second.image_angle) * 0.2
			
			arm_instances[i].speed = __speed
			arm_instances[i].direction = __direction
		}
	}
}

speed = _speed
direction = _direction
