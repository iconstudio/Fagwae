/// @description Dying
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0]) {
		with arm[0] {
			enemy_explode(1, 6 * image_xscale + 2, 1 + irandom(4) * image_xscale, 1)
			
			hspeed = random(4) - 2
			vspeed = -random(4) - 5
			if !global.extreme
				speed *= 0.5
			image_angle = direction
			gravity_direction = 270
			gravity = 0.1
		}
	
		var arm_second = arm[0].arm_instance
		if instance_exists(arm_second) {
			with arm_second {
				enemy_explode(1, 4 * image_xscale + 2, irandom(2) * image_xscale, 0)

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
