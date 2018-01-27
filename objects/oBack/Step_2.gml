/// @description Updating Background

if !available
	exit

if instance_exists(oPlayer) {
	if score_alpha < 1
		score_alpha += 0.01
	else
		score_alpha = 1
} else {
	if score_alpha > 0
		score_alpha -= 0.01
	else
		score_alpha = 0
}

if brightness < 1
	brightness += 0.014
else
	brightness = 1

square_saturation += 0.1
background_saturation += (0.1 * 192 - 5) / 192
scroll += 0.75
if scroll > 144 {
	scroll -= 144
	rots -= 42
	square_saturation -= 5
}

var ascore = (score - global.vscore) / 3
global.vscore += ascore

score_wave -= min(score_wave + max(0, ascore) / 10, 7) / 7
score_rotation = (score_rotation + 5) mod 360

event_user(0)
