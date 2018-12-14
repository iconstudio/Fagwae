/// @description 

if image_xscale != 1
	image_xscale += (1 - image_xscale) * 0.25
image_xscale = image_yscale

vspeed+= (1 - vspeed) / 9
