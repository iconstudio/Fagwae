for (var i = 0; i < 5; ++i) {
	if instance_exists(arm_instances[i])
		instance_destroy(arm_instances[i])
}
