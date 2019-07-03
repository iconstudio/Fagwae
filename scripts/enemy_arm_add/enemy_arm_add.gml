/// @description enemy_arm_add(armo, width, angle, [script_init], [layer])
/// @function enemy_arm_add
/// @param armo { string }
/// @param width { real }
/// @param angle { real }
/// @param [script_init] { script }
/// @param [layer] { layer }
var arm_script = noone, arm_layer = "Instances_Arms"
if argument_count >= 4 {
	arm_script = argument[3]
	if argument_count >= 5
		arm_layer = argument[4]
}

var arm = enemy_create(argument[0], x, y, 0, argument[2], id, arm_layer)
arm_properties[arm_number++] = [arm, argument[1], argument[2]]
with arm {
	if script_exists(arm_script)
		script_execute(arm_script, other.arm_number - 1)
}

return arm
