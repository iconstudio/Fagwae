/// @description Update
if appearing {
	y = ystart + appear_distance * appear_time / appear_period
	if appear_time < appear_period {
		appear_time++
	} else {
		fixy = y
		appearing = false
		alarm[1] = seconds(1)
	}
} else if hp > 0 {
	x = room_width * 0.5 + lengthdir_x(move_distance * 4, move_angle)
	y = fixy + lengthdir_y(move_distance, move_angle * 2)

	move_distance = move_distance_value * move_distance_time / move_distance_period
	if move_distance_time < move_distance_period
		move_distance_time++
	move_angle = 360 - move_angle_time / move_angle_period * 360
	if move_angle_time < move_angle_period
		move_angle_time++
	else
		move_angle_time = 0
} else {
	y += 0.4
}

if !dead { // It is not dead until actually explodes
	arm_rotation = arm_startangle + arm_rotation_time / arm_rotation_period * 360
	if arm_rotation_time < arm_rotation_period
		arm_rotation_time++
	else
		arm_rotation_time = 0
}

event_user(3)
