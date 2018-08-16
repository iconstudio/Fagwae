/// @description Dying

for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		with arm_instances[i] {
			enemy_explode(3 * image_xscale + random(4), 40 * image_xscale + random(10), 2 + irandom(4) * image_xscale, 1)
			gravity_direction = 270
			gravity = 0.35
		}
	}
	
	var arm_second = arm_instances[i].arm_instance
	if instance_exists(arm_second) {
		with arm_instances[i] {
			enemy_explode(3 * image_xscale + random(4), 40 * image_xscale + random(10), 2 + irandom(4) * image_xscale, 1)
			gravity_direction = 270
			gravity = 0.35
		}
	}
}
enemy_arm_explode()

enemy_explode(8 + random(5), 40 + random(20), 3 + irandom(2), 3)

instance_destroy()
