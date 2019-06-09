/// @description Update
for (var i = 0; i < arm_number; ++i) {
	var arm = arm_properties[i]

	if instance_exists(arm[0]) {
		speed = arm[1]
		direction = arm[2]
		arm[0].x = x + hspeed * 0.5
		arm[0].y = y + vspeed * 1.2
	}
}
vspeed = velocity
