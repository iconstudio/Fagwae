player_generator = new Scene(seqPlayerInit, SCREEN_W * 0.5, SCREEN_H * 0.5, "player")


// the score
actual_score = ["0"]
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


		if value < 10 {
			for (var i = 0; 0 < value; ++i) {
				var NewValue = real(actual_score[i]) + value
				if NewValue < 10 {
					actual_score[i] = string(NewValue)
				} else {
					var UpValue = NewValue - 10
					if array_length(actual_score) <= i {
					
					} else {
						actual_score[i + 1] += UpValue
					}
					value -= UpValue
				}
			}
		} else {
			

			var ValueMod = value mod 10
			do {
				value = value div 10
				ValueMod = value mod 10
			} until (ValueMod == 0)
		}
	}
}

