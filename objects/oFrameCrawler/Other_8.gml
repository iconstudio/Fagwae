/// @description Setting up a new moving plan
path_clear_points(planning_path)
planning_time = 0

if ++planning_count == planning_count_max { // last
	path_add_point(planning_path, x, y, 100)
	path_add_point(planning_path, x, -130, 100)
	exit
} else if planning_count > planning_count_max { // outside of room
	instance_destroy()
	exit
}

event_user(10)
