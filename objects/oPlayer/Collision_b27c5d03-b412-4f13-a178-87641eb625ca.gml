/// @description Getting a score

score += 100
if ++global.score_combo mod 10 == 0 {
	show_flashstring(x, y, "+" + string(floor(global.score_combo / 10)), 3)
} else {
	show_flashstring(x, y, "+" + number_format(global.score_combo / 10), 2)
}

with other
	instance_destroy()
