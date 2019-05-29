/// @description enemy_arm_launch()
/// @function enemy_arm_launch
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0]) {
		with arm[0]
			event_user(10)
	}
}
