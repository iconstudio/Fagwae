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

var ascore = (score - vscore) * 0.333
vscore += ascore

score_wave -= min(score_wave + max(0, ascore) * 0.1, 7) / 7
score_rotation = (score_rotation + 5) mod 360
