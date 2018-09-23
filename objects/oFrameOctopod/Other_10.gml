/// @description Dying

for (var i = 0; i < arm_number; ++i) {
	if instance_exists(arm_instances[i]) {
		with arm_instances[i] {
			enemy_explode(2 * image_xscale + 1, 10 * image_xscale + 4, 2 + irandom(4) * image_xscale, 0)
			
			hspeed = random(4) - 2
			vspeed = -random(4) - 5
			if !global.extreme
				speed *= 0.5
			image_angle = direction
			gravity_direction = 270
			gravity = 0.1
		}
	
		var arm_second = arm_instances[i].arm_instance
		if instance_exists(arm_second) {
			with arm_second {
				enemy_explode(2 * image_xscale + 1, 10 * image_xscale + 4, 2 + irandom(2) * image_xscale, 0)

				hspeed = random(4) - 2
				vspeed = -random(4) - 5
				if !global.extreme
					speed *= 0.5
				image_angle = direction
				gravity_direction = 270
				gravity = 0.1
			}
		} // else than it falls itself.
	}
}
enemy_arm_explode()

enemy_explode(8 + random(5), 40 + random(20), 3 + irandom(2), 3)

instance_destroy()
