player_generator = new Scene(seqPlayerInit, SCREEN_W * 0.5, SCREEN_H * 0.5, "player")


SCORE_DX = SCREEN_W * 0.5
SCORE_DY = SCREEN_W * 0.5

// the score
actual_score = [0]
// string to number
virtual_score = 0


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
		//virtual_score = max(virtual_score - value, 0)
	} else if 0 < value {
		virtual_score += value


		var i = 0, ValueMod = value mod 10, Temp = 0, Upper = 0

		do {
			if array_length(actual_score) <= i {
				Temp = (actual_score[i]) + ValueMod
				if 10 <= Temp {
					Upper = Temp div 10
					actual_score[i] = (Temp - Upper * 10)
					actual_score[i + 1] += (Upper)
					i++
				} else {
					actual_score[i++] = ValueMod
				}
			} else {
				array_push(actual_score, (ValueMod))
			}


			value = value div 10
			ValueMod = value mod 10
		} until (ValueMod == 0)
	}
}

