/// @description Destroying arms
for (var i = 0; i < arm_number; ++i) {
	var arm = arm_properties[i]

	if instance_exists(arm[0])
		instance_destroy(arm[0])
}
