/// @description Dying

enemy_explode(3, 48, 2 + irandom(2), 0)

instance_destroy()

arm_number = 8
arm_startangle = 0

arm_instances = array_create(arm_number, noone)
arm_angle = array_create(arm_number, 0)

for (var i = 0; i < arm_number; ++i) {
	arm_angle[i] = (arm_startangle + 45 * i) mod 360
	arm_instances[i] = enemy_create(enemy_joint_2, x, y, 0, arm_angle[i], id, "Instances_Arms")

	var arm_current = arm_instances[i]
	var count_create = 0
	with arm_current {
		arm_instance = enemy_create(enemy_joint_2, x, y, 0, arm_angle[i], id, "Instances_Arms")
		
		with arm_current {
			arm_instance = enemy_create(enemy_joint_2, x, y, 0, arm_angle[i], id, "Instances_Arms")
		}
	}
}
