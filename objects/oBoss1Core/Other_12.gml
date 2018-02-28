/// @description Update

arm_count = 0
for (var i = 0; i < arm_number; ++i) {
	with arm_instances[i] {
		x = other.x + lengthdir_x(dist + lengthdir_y(10, other.dangle + angle + org), other.angle + angle)
		y = other.y + lengthdir_y(dist + lengthdir_x(10, other.dangle + angle + org), other.angle + angle)
		other.arm_count++
	}
}

event_inherited()
