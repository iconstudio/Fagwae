/// @description motion_planning_init([terminater])
/// @function motion_planning_init
/// @param [terminater] { script }
function motion_planning_init() {
	// [[x0, y0, second0], [x1, y1, second1], ...]
	planning_list = []
	planning_number = 0
	planning_progress = 0
	planning_x_begin = x
	planning_y_begin = y
	planning_x = x
	planning_y = y
	planning_time = 0
	planning_period = 0
	planning_easer = ease_linear
	planning_terminator = 0 < argument_count ? argument[0] : noone



}
