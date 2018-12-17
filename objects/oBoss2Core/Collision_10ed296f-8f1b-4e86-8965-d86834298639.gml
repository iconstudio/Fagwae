/// @description Getting damage

if hp > 0 {
	event_inherited()
} else {
	with glove_left
		untargetable = true
	with glove_right
		untargetable = true
}
