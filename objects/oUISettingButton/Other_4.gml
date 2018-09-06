/// @description Resetting

dmode = 0
hidden = false
pressed = false

image_index = 1
if screen_scale <= 1 {
	image_xscale = 1
	image_yscale = 1
} else {
	image_index = 0
	if screen_iscale >= 8 {
		image_xscale = 1
		image_yscale = 1
	} else {
		image_xscale = screen_iscale / 8
		image_yscale = image_xscale
	}
}
ui_set_size(sprite_width * image_xscale, sprite_height * image_yscale)
