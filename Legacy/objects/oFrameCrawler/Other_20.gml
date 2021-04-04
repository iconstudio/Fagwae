if x <= roomborder_left
	angle_target = 60 + random(15)
else if x > roomborder_right
	angle_target = 105 + random(15)
else
	angle_target = 75 + random(30)

angle_target_gap = angle_target_previous - angle_target
angle_target_previous = angle_target

angle_previous = image_angle
angle_time = angle_period
