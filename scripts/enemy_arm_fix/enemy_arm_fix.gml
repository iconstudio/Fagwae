/// @description enemy_arm_fix([angle_plus])
/// @function enemy_arm_fix
/// @param [angle_plus] { real }
var angle_addition = 0
if 0 < argument_count
	angle_addition = argument[0]

var speed_previous = speed, direction_previous = direction
for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		speed = arm_width
		direction = arm_angle[i] + image_angle + angle_addition
		arm_instances[i].x = x + hspeed
		arm_instances[i].y = y + vspeed
		arm_instances[i].image_angle = direction
	}
}
speed = speed_previous
direction = direction_previous
