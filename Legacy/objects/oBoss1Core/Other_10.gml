/// @description Dying
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	with arm[0] {
		dead = true
		untargetable = true
	}
}

bullet_clear()

dead = false

alarm[1] = -1
alarm[2] = 1
alarm[3] = seconds(2.5)

