/// @description Update
image_xscale = ease_out_elastic(appear_time / appear_period)
image_yscale = image_xscale

if appear_time < appear_period
	appear_time++

