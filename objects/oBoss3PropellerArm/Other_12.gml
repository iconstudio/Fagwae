/// @description Update
var speed_previous = speed, direction_previous = direction
speed = length
direction = image_angle
var arm_newx = x + hspeed, arm_newy = y + vspeed
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0]) {
		direction = arm[2] + image_angle + rotation
		arm[0].x = arm_newx
		arm[0].y = arm_newy
		arm[0].image_angle = direction
	}
}
speed = speed_previous
direction = direction_previous

rotation = rotate_begin + rotate_time / rotate_period * 360 * rotation_sign
if rotate_time < rotate_period
	rotate_time++
else
	rotate_time = 0
