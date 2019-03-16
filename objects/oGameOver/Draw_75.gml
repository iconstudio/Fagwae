/// @description Covering over all GUIs and objects
gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color)
draw_sprite_ext(sMask32, 0, 0, 0, image_xscale, image_yscale, 0, $ffffff, 1)
gpu_set_blendmode(bm_add)
draw_sprite_ext(sMask32, 0, 0, 0, image_xscale, image_yscale, 0, $ffffff, ease_in_expo(fadeout_time / fadeout_period))
gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color)
draw_sprite_ext(sMask32, 0, 0, 0, image_xscale, image_yscale, 0, $ffffff, 1)
gpu_set_blendmode(bm_normal)

var popup_ratio = popup_time / popup_period
var popup_alpha = popup_ratio * (1 - ease_out_quintic(end_time / end_period))
var popup_x_draw = (screen_width - 372) * 0.5
var popup_y_draw = (screen_height - 40) * 0.5

draw_sprite_part_ext(sGameOver, 0, 0, 0, 372 * popup_ratio, 40, popup_x_draw, popup_y_draw, 1, 1, $ffffff, popup_alpha)
