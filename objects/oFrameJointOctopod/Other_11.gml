/// @description Creation

gravity_direction = 270
gravity = 0.2

pattern = 0
pattern_count = 0

arm_wiggle = random(30)
arm_number = 6
arm_width = 20
arm_startangle = random(60)

arm_instances = array_create(arm_number, noone)
arm_angle = array_create(arm_number, 0)

for (var i = 0; i < arm_number; ++i) {
	arm_angle[i] = (arm_startangle + 360 / arm_number * i) mod 360
	arm_instances[i] = enemy_create(enemy_joint_2, x, y, 0, arm_angle[i], id, "Instances_Arms")

	with arm_instances[i] {
		parent = other.id

		image_xscale = 0.6
		arm_wiggle = random(40)
		arm_number = 1
		arm_width = 30
		arm_angle = other.arm_angle
		arm_instance = enemy_create(enemy_joint_3, x, y, 0, arm_angle[i], id, "Instances_Arms")
		
		with arm_instance {
			parent = other.id
			
			image_xscale = 0.6
			image_yscale = 0.6
		}
	}
}
