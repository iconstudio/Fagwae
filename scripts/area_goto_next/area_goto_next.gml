/// @description area_goto_next()
/// @function area_goto_next

var area = id

instance_destroy()

with instance_create_layer(x, y, "Backend", global.area_list[++global.stage]){
	back_color = area.back_color
	square_saturation = area.square_saturation

	back_alpha = area.back_alpha
	background_param = area.background_param
	scroll = area.scroll
	rotation = area.rotation
	brightness = area.brightness
	score_alpha = area.score_alpha
	score_rotation = area.score_rotation
	score_wave = area.score_wave
}
