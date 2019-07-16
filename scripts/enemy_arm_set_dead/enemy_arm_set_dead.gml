/// @description enemy_arm_set_dead()
/// @function enemy_arm_set_dead
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0]) {
		with arm[0] {
			dead = true

			if 0 < arm_number
				enemy_arm_set_dead()
		}
	}
}
