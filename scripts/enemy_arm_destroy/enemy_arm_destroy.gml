/// @description enemy_arm_destroy()
/// @function enemy_arm_destroy
for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		instance_destroy(arm_instances[i])
	}
}
