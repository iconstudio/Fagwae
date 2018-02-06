/// @description Getting a life

if hp < hp_max {
	hp++
	show_flashstring(x, y, string(hp), 3)
} else {
	var ascore = 3000 + global.extreme * 3000
	score += ascore

	show_flashstring(x, y, "+" + string(ascore), 2)
}

with other
	instance_destroy()
