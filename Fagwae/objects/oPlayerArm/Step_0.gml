/// @description Update the angle
if image_angle != angle_dest {
	var gap = angle_difference(image_angle, angle_dest)
	if abs(gap) < angle_increment {
		image_angle = angle_dest
	} else {
		image_angle -= sign(gap) * angle_increment
	}
}
