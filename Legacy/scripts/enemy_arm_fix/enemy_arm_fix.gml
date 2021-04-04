/// @description enemy_arm_fix([angle_plus])
/// @function enemy_arm_fix
/// @param [angle_plus] { real }
function enemy_arm_fix() {
	var angle_addition = 0 < argument_count ? argument[0] : 0

	var arm, speed_previous = speed, direction_previous = direction
	for (var i = 0; i < arm_number; ++i) {
		arm = arm_properties[i]

		if instance_exists(arm[0]) {
			speed = arm[1]
			direction = arm[2] + image_angle + angle_addition
			arm[0].x = x + hspeed
			arm[0].y = y + vspeed
			arm[0].image_angle = direction
		}
	}
	speed = speed_previous
	direction = direction_previous



}
