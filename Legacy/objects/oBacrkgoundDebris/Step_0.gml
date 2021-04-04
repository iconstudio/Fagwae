if disappear_time++ < disappear_period
	image_alpha = 1 - disappear_time / disappear_period
else
	instance_destroy()
