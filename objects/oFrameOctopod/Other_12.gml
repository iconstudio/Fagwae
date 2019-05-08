/// @description Update
event_inherited()

arm_wiggle += 5

for (var i = 0; i < arm_number; ++i) {
	speed = arm_width
	if instance_exists(arm_instances[i]) {
		direction = arm_angle[i] + image_angle + lengthdir_x(20, arm_wiggle)
		arm_instances[i].x = x + hspeed
		arm_instances[i].y = y + vspeed
		arm_instances[i].image_angle += (direction - arm_instances[i].image_angle) * 0.6
		
		var arm_second = arm_instances[i].arm_instance
		if instance_exists(arm_second) {
			arm_instances[i].speed = arm_instances[i].arm_width
			arm_instances[i].direction = arm_instances[i].image_angle
			var __speed = arm_instances[i].speed, __direction = arm_instances[i].image_angle
			arm_second.x = arm_instances[i].x + arm_instances[i].hspeed
			arm_second.y = arm_instances[i].y + arm_instances[i].vspeed
			arm_second.image_angle += (arm_instances[i].image_angle + lengthdir_x(15, arm_wiggle) - arm_second.image_angle) * 0.2
			
			arm_instances[i].speed = __speed
			arm_instances[i].direction = __direction
		}
	}
}
speed = 0

path_position = planning_time / planning_period
if path_position != path_positionprevious {
	var _xp = path_get_x(planning_path, path_positionprevious), _yp = path_get_y(planning_path, path_positionprevious)
	var _xn = path_get_x(planning_path, path_position), _yn = path_get_y(planning_path, path_position)
	image_angle = point_direction(_xp, _yp, _xn, _yn)
}

if planning_time < planning_period
	planning_time++
