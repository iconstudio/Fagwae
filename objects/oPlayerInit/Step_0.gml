/// @description 

y += (ystart - y) / 10

image_xscale += (1 - image_xscale) / 10
image_yscale = image_xscale

if image_alpha < 1
	image_alpha += 0.01
