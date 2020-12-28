/// @description Getting damage
event_inherited()

if hp < hp_max * 0.3 {
	if !pattern_hp_low {
		pattern04_period += seconds(1)
	}
	
	pattern_hp_low = true
}
