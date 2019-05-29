arm_count = 0
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	with arm[0] {
		x = other.x + lengthdir_x(dist + lengthdir_y(10, other.arm_rotation + angle + org), other.move_angle + angle)
		y = other.y + lengthdir_y(dist + lengthdir_x(10, other.arm_rotation + angle + org), other.move_angle + angle)
		other.arm_count++
	}
}
