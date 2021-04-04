/// @description Covering over all GUIs and objects
var disappear_factor = 1 - disappear_time / disappear_period
gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color)
draw_sprite_ext(sMask32, 0, 0, 0, image_xscale, image_yscale, 0, $ffffff, 1)
gpu_set_blendmode(bm_add)
draw_sprite_ext(sMask32, 0, 0, 0, image_xscale, image_yscale, 0, $ffffff, appear_time / appear_period * 0.5 * ease_in_out_cubic(disappear_factor))
gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color)
draw_sprite_ext(sMask32, 0, 0, 0, image_xscale, image_yscale, 0, $ffffff, 1)
gpu_set_blendmode(bm_normal)

var information_factor = popup_time[0] / popup_period[0]
var selector_factor = max(0, popup_time[1] / popup_period[1])
var yes_alpha, no_alpha
if global.flag_is_mobile {
	yes_alpha = 1
	no_alpha = 1
} else {
	yes_alpha = (0.5 + (selected == 0) * 0.5)
	no_alpha = (0.5 + (selected == 1) * 0.5)
}

draw_set_color($ffffff)
draw_set_halign(1)
draw_set_valign(1)
draw_set_alpha(disappear_factor * information_factor)
draw_text_transformed(screen_width * 0.5, screen_height * 0.5 - 30 - (1 - information_factor) * 500, "CONTINUE?", 4, 4, 0)
draw_set_alpha(disappear_factor * selector_factor * yes_alpha)
draw_text_transformed(screen_width * 0.25, screen_height * 0.6, "YES", 3, 3, 0)
draw_set_alpha(disappear_factor * selector_factor * no_alpha)
draw_text_transformed(screen_width * 0.75, screen_height * 0.6, "NO", 3, 3, 0)
draw_set_alpha(1)
