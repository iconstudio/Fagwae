/// @description enemy_arm_launch()
/// @function enemy_arm_launch

for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		with arm_instances[i]
			event_user(10)
	}
}