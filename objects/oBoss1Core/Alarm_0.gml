/// @description Creating arms
var arm = enemy_create(enemy_boss_1C, x, -200, 0, 0, id, "Boss_C")
arm.angle = arm_creation_count * 60 + 210
arm.org = 240
if arm_creation_count & 1
	arm.dist = 50 * arm_width
else
	arm.dist = 50
arm_properties[arm_number++] = [arm, 0, 0]

arm = enemy_create(enemy_boss_1B, x, -200, 0, 0, id, "Boss_B")
arm.angle = arm_creation_count * 60 + 30
arm.org = 120
if arm_creation_count & 1
	arm.dist = 50 * arm_width
else
	arm.dist = 50
arm_properties[arm_number++] = [arm, 0, 0]

arm = enemy_create(enemy_boss_1A, x, -200, 0, 0, id, "Boss_A")
arm.angle = arm_creation_count * 60
arm.org = 0
arm.dist = 70
arm_properties[arm_number++] = [arm, 0, 0]

//event_user(3)

if ++arm_creation_count < 6
	alarm[0] = arm_creation_period
