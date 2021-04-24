/// @description Create menu status
sub_state_normal.set_initializer(function() {
	//var before = sq_element
	//sq_element = layer_sequence_create(lyr_interface, 640, 960, seqMainExit)
	//layer_sequence_play(sq_element)
	//layer_background_destroy(before)
})


sub_state_exit = new Astate()
sub_state_exit.caption = "main-sub-start-exit"


sub_state_fadeout.set_duration(0.9)
sub_state_fadeout.set_initializer(function() {
	var before = sq_element
	sq_element = layer_sequence_create(lyr_interface, 640, 960, seqMainExitIntroFadeout)
	layer_sequence_play(sq_element)
	layer_background_destroy(before)
})


sub_state_fadein.set_duration(0.9)
sub_state_fadein.set_initializer(function() {
	var before = sq_element
	sq_element = layer_sequence_create(lyr_interface, 640, 960, seqMainExitIntroFadein)
	layer_sequence_play(sq_element)
	layer_background_destroy(before)
})


sub_state_close_2 = new Astate()
sub_state_close_2.caption = "main-sub-start-close"
sub_state_close_2.set_duration(0.95)
sub_state_close_2.set_next(sub_state_normal)
sub_state_close_2.set_updater(function(progress) {
})
sub_state_close_2.set_callback(function() {
})
//sub_state_close_2.set_drawer(draw_transition)


sub_state_close_1 = new Astate()
sub_state_close_1.caption = "main-sub-start-close"
sub_state_close_1.set_duration(1.2)
sub_state_close_1.set_next(sub_state_close_2)
sub_state_close_1.set_updater(function(progress) {
})
sub_state_close_1.set_callback(function() {
})
//sub_state_close_1.set_drawer(draw_transition)


// 글자가 나타남
sub_state_open_3 = new Astate()
sub_state_open_3.caption = "main-sub-exit-open-3"
sub_state_open_3.set_duration(1)


// 스포트라이트가 벌어짐
sub_state_open_2 = new Astate()
sub_state_open_2.caption = "main-sub-exit-open-2"
sub_state_open_2.set_duration(0.9)
sub_state_open_2.set_next(sub_state_normal)
sub_state_open_2.set_updater(function(progress) {
})
sub_state_open_2.set_callback(function() {
})
sub_state_open_2.set_drawer(function() {
})


// 화면이 암전되고 동시에 한가운데에 빛줄기가 나타남
sub_state_open_1 = new Astate()
sub_state_open_1.caption = "main-sub-exit-open-1"
sub_state_open_1.set_duration(1.5)
sub_state_open_1.set_next(sub_state_open_2)
sub_state_open_1.set_updater(function(progress) {
})
sub_state_open_1.set_callback(function() {
})
sub_state_open_1.set_drawer(function() {
})


sub_state_intro = new Astate()
sub_state_intro.caption = "main-sub-exit-intro-1"
sub_state_intro.set_duration(1.4)
sub_state_intro.set_next(sub_state_normal)
sub_state_intro.set_initializer(function() {
	sq_element = layer_sequence_create(lyr_interface, 640, 960, seqMainExitIntro)
	layer_sequence_play(sq_element)
})
sub_state_intro.set_updater(function(progress) {
})


make_back_color = function(hue) {
	return make_color_hsv(hue, 230, 128)
}

// 250, 90
lyr_interface = layer_get_id("interface")
corner_color = make_back_color(206)
corner_angle = point_direction(0, 0, 250, -90)

mode_enter = sub_state_intro
//__callback_open = sub_state_open_1
__callback_close = sub_state_close_1

