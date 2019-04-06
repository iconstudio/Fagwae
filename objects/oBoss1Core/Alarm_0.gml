/// @description Creating arms
arm_instances[arm_number] = enemy_create(enemy_boss_1C, x, -200, 0, 0, id, "Boss_C")
arm_instances[arm_number].angle = ccnt * 60 + 210
arm_instances[arm_number].org = 240
if ccnt & 1
	arm_instances[arm_number].dist = 50 * arm_width
else
	arm_instances[arm_number].dist = 50
arm_number++

arm_instances[arm_number] = enemy_create(enemy_boss_1B, x, -200, 0, 0, id, "Boss_B")
arm_instances[arm_number].angle = ccnt * 60 + 30
arm_instances[arm_number].org = 120
if ccnt & 1
	arm_instances[arm_number].dist = 50 * arm_width
else
	arm_instances[arm_number].dist = 50
arm_number++

arm_instances[arm_number] = enemy_create(enemy_boss_1A, x, -200, 0, 0, id, "Boss_A")
arm_instances[arm_number].angle = ccnt * 60
arm_instances[arm_number].org = 0
arm_instances[arm_number].dist = 70
arm_number++

event_user(2)

if ++ccnt < 6
	alarm[0] = 6
