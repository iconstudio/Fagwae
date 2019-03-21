/// @description Initialize the path
path_add_point(planning_path, x, y, 100)
var _xp = x, _yp = y, _xn = 80 + random(room_width - 160), _yn = 80 + random(room_height * 0.4)
while point_distance(_xp, _yp, _xn, _yn) < 100 {
	_xn = 80 + random(room_width - 160)
	_yn = 80 + random(room_height * 0.4)
}
path_add_point(planning_path, _xn, _yn, 100)
