if global.paused {
	if lit_time < lit_period
		lit_time += Delta
	else
		lit_time = lit_period


} else {
	if 0 < lit_time
		lit_time -= Delta
	else
		instance_destroy()
}
