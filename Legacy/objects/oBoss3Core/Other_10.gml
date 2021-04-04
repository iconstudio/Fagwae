/// @description Dying
enemy_arm_set_dead()
bullet_clear()
pattern = -1
pattern_opened = true
dead = true

alarm[8] = 1
alarm[9] = seconds(2.8)