var create_ratio = create_time / create_period
image_xscale = 2 - (create_ratio)
image_yscale = image_xscale
image_alpha = 0.5 + create_ratio * 0.5
y = ystart + create_distance * (1 - ease_in_out_cubic(create_ratio))

if create_time < create_period {
	create_time++
} else {
	with instance_create_layer(xstart, ystart, "Player", oPlayer)
		vspeed = -2
	instance_destroy()
}