/// @description Getting a life

if hp < hp_max {
	hp++
	show_flashstring(x, y, string(hp), 3)
} else {
	var ascore = 3000 + global.extreme * 3000
	global.playerscore += ascore

	show_flashstring(x, y, "+" + string(ascore), 2)
}

audio_play_sound(soundLifeUp, 20, false)

with other
	instance_destroy()
