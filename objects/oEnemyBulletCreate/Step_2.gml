image_xscale -= 0.05
image_yscale = image_xscale

if image_xscale <= 0.01 {
	instance_destroy()
	exit
}

if instance_exists(parent) {
	x = parent.x
	y = parent.y
} else {
	instance_destroy()
	exit
}
