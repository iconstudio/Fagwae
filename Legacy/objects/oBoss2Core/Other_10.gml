/// @description Dying
enemy_arm_set_dead()
bullet_clear()
pattern = -1
pattern_opened = true
dead = true

for (var i = 0; i < 7; ++i)
	alarm[i] = -1

alarm[8] = 1
alarm[9] = seconds(1)

