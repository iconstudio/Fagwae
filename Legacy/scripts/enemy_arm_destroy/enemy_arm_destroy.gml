/// @description enemy_arm_destroy()
/// @function enemy_arm_destroy
function enemy_arm_destroy() {
	for (var i = 0; i < arm_number; ++i) {
		arm = arm_properties[i]

		if instance_exists(arm[0])
			instance_destroy(arm[0])
	}



}
