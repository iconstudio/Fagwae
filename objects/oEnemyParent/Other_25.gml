/// @description Processing 

hp -= hurt
if hp > 0 {
	damaged = 1
} else if !dead {
	dead = true
	event_user(0)

	if parent != noone or score_loot == 0 {
		score += score_dead
	} else {
		var ppscore = floor(global.score_combo * 0.1)
		global.player_fever_laser = min(100, global.player_fever_laser + score_loot * 0.2)

		score += score_dead + ppscore
		if ppscore >= 1 {
			show_flashstring(x, y, "+" + string(ppscore), 0)
			global.player_fever_laser = min(100, global.player_fever_laser + ppscore)
		}
	}
}
