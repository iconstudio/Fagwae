var was_left = (move_h_anchor == LEFT)
var was_right = (move_h_anchor == RIGHT)

if (global.io_p_left and global.io_right and was_right)
or (global.io_left and !global.io_right)
or (!global.io_p_right and global.io_left and was_left) {
	move_h_anchor = LEFT
}
else if (global.io_p_right and global.io_left and was_left)
or (global.io_right and !global.io_left)
or (!global.io_p_left and global.io_right and was_right) {
	move_h_anchor = RIGHT
} else {
	move_h_anchor = NONE
}

var was_up = (move_v_anchor == UP)
var was_down = (move_v_anchor == DOWN)

if (global.io_p_up and global.io_down and was_down)
or (global.io_up and !global.io_down)
or (!global.io_p_down and global.io_up and was_up) {
	move_v_anchor = UP
}
else if (global.io_p_down and global.io_up and was_up)
or (global.io_down and !global.io_up)
or (!global.io_p_up and global.io_down and was_down) {
	move_v_anchor = DOWN
} else {
	move_v_anchor = NONE
}
