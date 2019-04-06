/// @description enemy_arm_init(armo, number, width, [script_init], [rotation_begin], [layer])
/// @function enemy_arm_init
/// @param armo { string }
/// @param number { integer }
/// @param width { real }
/// @param [script_init] { script }
/// @param [rotation_begin] { real }
/// @param [layer] { layer }
arm_number = argument[1]
arm_width = argument[2]
arm_startangle = 0

var arm_scriptinit = noone
if argument_count >= 4 {
	arm_scriptinit = argument[3]
	if argument_count >= 5
		arm_startangle = argument[4]
}
var arm_layer = "Instances_Arms"
if argument_count >= 6
	arm_layer = argument[5]

arm_instances = array_create(arm_number, noone)
arm_angle = array_create(arm_number, 0)
for (var i = 0; i < arm_number; ++i) {
	arm_angle[i] = (arm_startangle + 360 / arm_number * i) mod 360
	arm_instances[i] = enemy_create(argument[0], x, y, 0, arm_angle[i], id, arm_layer)

	with arm_instances[i] {
		if script_exists(arm_scriptinit)
			script_execute(arm_scriptinit, i)
	}
}
