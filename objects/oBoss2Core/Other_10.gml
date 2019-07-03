/// @description Dying
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0])
		arm[0].dead = true
}

bullet_clear()

pattern = -1
pattern_opened = true
dead = true

for (var i = 0; i < 7; ++i)
	alarm[i] = -1

alarm[8] = 2
alarm[9] = seconds(1)

