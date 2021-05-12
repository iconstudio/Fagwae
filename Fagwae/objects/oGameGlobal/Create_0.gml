player_generator = new Scene(seqPlayerInit, SCREEN_W * 0.5, SCREEN_H * 0.5, "player")


// the score
virtual_score = ["0"]
// string to number
score_indicate = 0


capture = -1


event_user(0)


key_anchor = NONE
key_pin_stop = false
key_pin_duration = -1
key_pin_period_short = 0.1
key_pin_period_long = 0.5
key_pinned = NONE


function shake(amplitude) {
	
}


function score_add(value) {
	if value < 0 {
		score_indicate = max(score_indicate - value, 0)
	} else if 0 < value {
		score_indicate += value


		if value < 10 {
			var i = 0
			
		} else {
			

			var ValueMod = value mod 10
			do {
				value = value div 10
				ValueMod = value mod 10
			} until (ValueMod == 0)
		}
	}
}
