/// @description Update
do_update_logic()

var was_left = (arrow_hr_key_anchor == LEFT)
var was_right = (arrow_hr_key_anchor == RIGHT)
arrow_hr_key_anchor = NONE

if (global.io_p_left and global.io_right and was_right)
or (global.io_left and !global.io_right)
or (!global.io_p_right and global.io_left and was_left) {
	arrow_hr_key_anchor = LEFT
}
else if (global.io_p_right and global.io_left and was_left)
or (global.io_right and !global.io_left)
or (!global.io_p_left and global.io_right and was_right) {
	arrow_hr_key_anchor = RIGHT
}

if global.io_p_confirm
	event_user(5)

if global.io_p_back
	event_user(6)
