/// @description Resetting

dmode = 0
pressed = false

image_index = 1
if screen_scale <= 1 {
	image_xscale = 1
	image_yscale = 1
	mask_index = sMask32Inverse
	ui_set_size(32, 32)
} else {
	image_index = 0
	if screen_iscale >= 8 {
		image_xscale = 1
		image_yscale = 1
	} else {
		image_xscale = screen_iscale / 8
		image_yscale = image_xscale
	}
	mask_index = sprite_index
	ui_set_size(256 * image_xscale, 256 * image_yscale)
}
