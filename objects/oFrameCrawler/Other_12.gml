/// @description Update
event_inherited()

path_position = planning_time / planning_period
if path_position != path_positionprevious {
	var _xp = path_get_x(planning_path, path_positionprevious), _yp = path_get_y(planning_path, path_positionprevious)
	var _xn = path_get_x(planning_path, path_position), _yn = path_get_y(planning_path, path_position)
	image_angle = point_direction(_xp, _yp, _xn, _yn)
}
if planning_time < planning_period {
	planning_time++
} else {
	path_end()
}
enemy_arm_fix()
