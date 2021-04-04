/// @description Update

image_xscale -= 0.01
image_yscale = image_xscale

if image_xscale <= 0
	instance_destroy()

if speed != 0.5
	speed += (0.5 - speed) / 7
direction += ra
