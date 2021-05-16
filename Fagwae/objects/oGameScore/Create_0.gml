SCORE_DX = SCREEN_W * 0.5
SCORE_DY = SCREEN_W * 0.5

score_cycle = 0
SCORE_CYCLE_INCR = 26


value = new List()
value_virtual = 0


clear = function() {
		
}


set = function(Value) {
		
}


add = function(Value) {
	if is_nan(Value)
		exit

	
	if Value < 0 {
		//value_virtual = max(value_virtual - Value, 0)
	} else if 0 < Value {
		value_virtual += Value


		var Upper = 0
		var AgendaIndex = 0, Agenda = Value mod 10
		var Size = value.get_size()

		do {
			if AgendaIndex < Size {
				Agenda += value.at(AgendaIndex)
				if 10 <= Agenda {
					Upper = Agenda div 10
					value.set_at(AgendaIndex, Agenda - Upper * 10)
					if AgendaIndex + 1 < Size
						value.set_at(AgendaIndex + 1, value.at(AgendaIndex + 1) + Upper)
					else
						value.push_back(Upper)
				} else {
					value.set_at(AgendaIndex, Agenda)
				}
			} else {
				value.push_back(Agenda)
			}


			Value = Value div 10
			Agenda = Value mod 10
			AgendaIndex++
			Size = value.get_size()
		} until (Agenda == 0)
	}
}


get_size = method(value, value.get_size)
foreach = method(value, value.foreach)
foreach_n = method(value, value.foreach_n)
foreach_all = method(value, value.foreach_all)
enumerate = method(value, value.enumerate)
enumerate_all = method(value, value.enumerate_all)

