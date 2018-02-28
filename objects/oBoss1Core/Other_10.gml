/// @description Dying

for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		with arm_instances[i]
			dead = true
	}
}

bullet_clear()

dead = false

alarm[1] = -1
alarm[2] = 1
alarm[3] = 150

