/// @description enemy_arm_init(armo, number, width, [script_init], [rotation_begin], [layer])
/// @function enemy_arm_init
/// @param armo { string }
/// @param number { integer }
/// @param width { real }
/// @param [script_init] { script }
/// @param [rotation_begin] { real }
/// @param [layer] { layer }
arm_number = argument[1]
arm_startangle = 0
arm_properties = array_create(arm_number, 0)

var arm_script = noone, arm_layer = "Instances_Arms"
if argument_count >= 4 {
	arm_script = argument[3]
	if argument_count >= 5 {
		arm_startangle = argument[4]
		if argument_count >= 6
			arm_layer = argument[5]
	}
}

var arm_angle_one, arm
for (var i = 0; i < arm_number; ++i) {
	arm_angle_one = (arm_startangle + 360 / arm_number * i) mod 360
	arm_properties[i] = [enemy_create(argument[0], x, y, 0, arm_angle_one, id, arm_layer), argument[2], arm_angle_one]

	arm = arm_properties[i]
	with arm[0] {
		if script_exists(arm_script)
			script_execute(arm_script, i)
	}
}
