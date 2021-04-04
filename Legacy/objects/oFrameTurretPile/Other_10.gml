/// @description Dying
for (var i = 0; i < arm_number; ++i) {
	var arm = arm_properties[i]

	with arm[0]
		event_user(0)
}
enemy_explode(3, 42, 2 + irandom(1), 2)

instance_destroy()
