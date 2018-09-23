/// @description 

shot_direction += get_rotation_next(shot_direction, point_direction(x, y, global.px, global.py), 20)
if shot_direction > 180
	shot_direction -= 360
else if shot_direction < -180
	shot_direction += 360
