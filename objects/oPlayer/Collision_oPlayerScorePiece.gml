/// @description Getting a score

global.playerscore += 100
if ++global.score_combo mod 10 == 0 {
	show_flashstring(x, y, "+" + string(floor(global.score_combo * 0.1)), 3)
} else {
	show_flashstring(x, y, "+" + number_format(global.score_combo * 0.1), 2)
}

with other
	instance_destroy()
