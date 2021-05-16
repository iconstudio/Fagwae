if global.paused {
	if time < period
		time += Delta
	else
		time = period


} else {
	if 0 < time
		time -= Delta
	else
		instance_destroy()
}
