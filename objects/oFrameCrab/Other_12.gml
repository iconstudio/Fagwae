/// @description Update
event_inherited()

var _speed = speed, _direction = direction
for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		speed = arm_distance[i]
		direction = arm_angle[i] + image_angle
		arm_instances[i].x = x + hspeed
		arm_instances[i].y = y + vspeed
		arm_instances[i].image_angle = direction
	}
}

speed = _speed
direction = _direction
image_angle = direction
