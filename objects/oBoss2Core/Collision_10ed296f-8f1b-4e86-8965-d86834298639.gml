/// @description Getting damage
if 0 < hp {
	event_inherited()
} else {
	with glove_left
		untargetable = true
	with glove_right
		untargetable = true
}
