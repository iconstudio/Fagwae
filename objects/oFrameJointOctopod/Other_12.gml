/// @description Update

event_inherited()

arm_wiggle += 21;

var _speed = speed, _direction = direction
for (var i = 0; i < arm_number; ++i) {
	speed = arm_width
	if instance_exists(arm_instances[i]) {
		direction = arm_angle[i] + image_angle
		arm_instances[i].x = x + hspeed
		arm_instances[i].y = y + vspeed
		arm_instances[i].image_angle = direction
	}
}

speed = _speed
direction = _direction
