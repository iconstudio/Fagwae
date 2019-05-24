/// @description Update
var speed_previous = speed, direction_previous = direction
for (var i = 0; i < arm_number; ++i) {
	var arm = arm_properties[i]

	if instance_exists(arm[0]) {
		speed = arm[1]
		direction = arm[2] + image_angle
		arm[0].x = x + hspeed * 0.5
		arm[0].y = y + vspeed * 1.2
	}
}
speed = speed_previous
direction = direction_previous
