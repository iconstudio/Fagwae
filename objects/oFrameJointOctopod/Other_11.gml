/// @description Creation

pattern = 0
pattern_count = 0

arm_wiggle = 0
arm_number = 6
arm_width = 40 * point_distance(lengthdir_x(1, 0), lengthdir_y(1, 0), lengthdir_x(1, 120), lengthdir_y(1, 120))
arm_startangle = 30

arm_instances = array_create(arm_number, noone)
arm_angle = array_create(arm_number, 0)

for (var i = 0; i < arm_number; ++i) {
	arm_angle[i] = (arm_startangle + 360 / arm_number * i) mod 360
	arm_instances[i] = enemy_create(enemy_joint_2, x, y, 0, arm_angle[i], id, "Instances_Arms")

	with arm_instances[i] {
		parent = other.id
		
		image_xscale = 0.8
		arm_number = 1
		arm_width = 40
		arm_angle = other.arm_angle
		arm_instance = enemy_create(enemy_joint_2, x, y, 0, arm_angle[i], id, "Instances_Arms")
		
		with arm_instance {
			parent = other.id
		}
	}
}
