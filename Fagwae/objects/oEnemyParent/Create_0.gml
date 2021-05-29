name = ""


dead = false
invincible = 0
blink = 0 // 0 ~ 1
hpmax = 1
hp = hpmax


score_given = 17


damage = 1 // collision damage


arms = null


/// @function got_damage(amount=1)
function got_damage() {
	if dead or invincible == -1 or 0 < invincible
		exit


	var amount = 1
	if 0 < argument_count
		amount = argument[0]

	if 0 < amount {
		hp -= amount

		if 0 < hp {
			event_user(1)
		} else {
			dead = true
			event_user(0)
		}
	}
}
