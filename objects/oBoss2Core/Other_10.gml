/// @description Dying

for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		with arm_instances[i] {
			dead = true
		}
	}
}

bullet_clear()

dead = false

for (var i = 0; i < 7; ++i)
	alarm[i] = -1

alarm[9] = 150

