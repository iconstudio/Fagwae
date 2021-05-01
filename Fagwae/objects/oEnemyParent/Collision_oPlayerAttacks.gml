/// @description Get hurt
with other {
	if !done {
		event_user(0)
		done = true
	}
}

got_damage(other.damage)
