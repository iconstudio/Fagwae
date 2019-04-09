/// @description Limitation, Outline
event_user(0)

if x < roomborder_left
	x = roomborder_left
if x >= roomborder_right
	x = roomborder_right
if y < roomborder_top
	y = roomborder_top
if y >= roomborder_bottom
	y = roomborder_bottom

global.px = x
global.py = y

out_rotation -= 17
if out_rotation < 0
	out_rotation += 360
