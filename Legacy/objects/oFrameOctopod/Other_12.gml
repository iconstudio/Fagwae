/// @description Update
event_inherited()

arm_wiggle += 5

for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0]) {
		speed = arm[1]
		direction = arm[2] + image_angle + lengthdir_x(20, arm_wiggle)
		arm[0].x = x + hspeed
		arm[0].y = y + vspeed
		arm[0].image_angle += (direction - arm[0].image_angle) * 0.6
		
		var arm_second = arm[0].arm_instance
		if instance_exists(arm_second) {
			arm[0].speed = arm[0].arm_width
			arm[0].direction = arm[0].image_angle
			var __speed = arm[0].speed, __direction = arm[0].image_angle
			arm_second.x = arm[0].x + arm[0].hspeed
			arm_second.y = arm[0].y + arm[0].vspeed
			arm_second.image_angle += (arm[0].image_angle + lengthdir_x(15, arm_wiggle) - arm_second.image_angle) * 0.2
			
			arm[0].speed = __speed
			arm[0].direction = __direction
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
