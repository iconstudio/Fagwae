name = ""

invincible = 0
hpmax = 1
hp = hpmax

damage = 1 // collision damage


/// @function got_damage(amount=1)
function got_damage() {
	if invincible == -1 or 0 < invincible
		exit

	var amount = 1
	if 0 < argument_count
		amount = argument[0]

	if 0 < amount {
		hp -= amount

		if 0 < hp {
			event_user(1)
		} else {
			event_user(0)
		}
	}
}


/// @function destroy()
function destroy() {
	instance_destroy()
	event_user(15)
}
