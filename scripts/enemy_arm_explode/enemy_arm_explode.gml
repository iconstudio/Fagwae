/// @description enemy_arm_explode()
/// @function enemy_arm_explode
for (var i = 0; i < arm_number; ++i) {
	var arm = arm_properties[i]

	if instance_exists(arm[0]) {
		with arm[0]
			event_user(0)
	}
}
