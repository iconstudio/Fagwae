/// @description Dying

enemy_arm_explode()
with glove_left
	event_user(0)
with glove_right
	event_user(0)

dead = true
//show_polygon(x, y, 6, 160, polycol, polygon)
enemy_explode(25, 256, 9, 9)
/*
if global.extreme
	instance_create_layer(x, y, "Player", oPlayerLife)

var stage = instance_find(oStageParent, 0)

with instance_create_layer(x, y, "Backend", global.area_list[++global.stage]){
	back_color = stage.back_color
	square_saturation = stage.square_saturation

	back_alpha = stage.back_alpha
	background_param = stage.background_param
	scroll = stage.scroll
	rotation = stage.rotation
	brightness = stage.brightness
	score_alpha = stage.score_alpha
	score_rotation = stage.score_rotation
	score_wave = stage.score_wave
}
*/
instance_destroy()
