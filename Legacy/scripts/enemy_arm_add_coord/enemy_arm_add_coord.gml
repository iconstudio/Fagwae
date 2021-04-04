/// @description enemy_arm_add_coord(armo, x, y, [script_init], [layer])
/// @function enemy_arm_add_coord
/// @param armo { string }
/// @param x { real }
/// @param y { real }
/// @param [script_init] { script }
/// @param [layer] { layer }
function enemy_arm_add_coord() {
	var arm_script = noone, arm_layer = "Instances_Arms"
	if argument_count >= 4 {
		arm_script = argument[3]
		if argument_count >= 5
			arm_layer = argument[4]
	}

	var arm_distance = point_distance(x, y, argument[1], argument[2])
	var arm_direction = point_direction(x, y, argument[1], argument[2])
	var arm = enemy_create(argument[0], argument[1], argument[2], 0, arm_direction, id, arm_layer)
	arm.parent = id
	arm_properties[arm_number++] = [arm, arm_distance, arm_direction]
	with arm {
		if script_exists(arm_script)
			script_execute(arm_script, other.arm_number - 1)
	}

	return arm



}
