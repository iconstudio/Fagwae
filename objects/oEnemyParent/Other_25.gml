/// @description Processing 

hp -= hurt
if hp > 0 {
	damaged = 1

	if global.extreme
		score += score_loot * 1.1
	else
		score += score_loot
	//laser_charge(ceil(score_loot / 5) * 5)
} else if !dead {
	dead = true
	event_user(0)

	if parent != noone or score_loot == 0 {
		score += score_dead
	} else {
		var ppscore = floor(global.score_combo / 10)
		//if (other.object_index != objPlayerLaser)
		//	laser_charge(floor(ppscore / 5) * 5)

		score += score_dead + ppscore
		if ppscore >= 1
			show_flashstring(x, y, "+" + string(ppscore), 0)
	}
}
