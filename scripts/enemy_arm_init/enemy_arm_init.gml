/// @description enemy_arm_init(armo, number, width, [script_init], [rotation_begin])
/// @function enemy_arm_init
/// @param armo { string }
/// @param number { integer }
/// @param width { real }
/// @param [script_init] { script }
/// @param [rotation_begin] { real }

arm_number = argument[1]
arm_width = argument[2]
arm_startangle = 0

var arm_scriptinit = -1
if argument_count >= 4 {
	arm_scriptinit = argument[3]
	if argument_count >= 5
		arm_startangle = argument[4]
}

arm_instances = array_create(arm_number, noone)
arm_angle = array_create(arm_number, 0)

for (var i = 0; i < arm_number; ++i) {
	arm_instances[i] = enemy_create(argument[0], x, y)
	arm_angle[i] = (arm_startangle + 360 / arm_number * i) mod 360

	with arm_instances[i] {
		parent = other.id
		depth--

		if arm_scriptinit != -1
			script_execute(arm_scriptinit, i)
	}
}
