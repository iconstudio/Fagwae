/// @description 

y += (ystart - y) * 0.1

image_xscale += (1 - image_xscale) * 0.1
image_yscale = image_xscale

if image_alpha < 1
	image_alpha += 0.01
