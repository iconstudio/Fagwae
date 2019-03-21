if fade_mode == 0 {
	damaged = 1

	image_xscale += 0.01 + image_xscale * 0.5
	if image_xscale > 1.1
		fade_mode = 1
} else if fade_mode == 1 {
	image_xscale += (1 - image_xscale) * 0.333
}

image_yscale = image_xscale
