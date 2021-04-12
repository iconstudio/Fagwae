/// @description Create menu status
sub_state_normal.set_drawer(function() {
	draw_set_color($821071)
	draw_triangle(640 - normal_w, 960, 640, 960 - normal_h, 640, 960, false)
	draw_set_color($ffffff)
	draw_set_halign(1)
	draw_set_valign(1)
	draw_text_transformed(normal_x, normal_y, "EXIT", 1, 1, title_angle)
	draw_set_color($ffffff)
})

sub_state_exit = new menu_state()
sub_state_exit.caption = "main-sub-start-exit"

sub_state_close_2 = new menu_state()
sub_state_close_2.caption = "main-sub-start-close"
sub_state_close_2.set_duration(0.95)
sub_state_close_2.set_next(sub_state_normal)
sub_state_close_2.set_updater(function(progress) {
})
sub_state_close_2.set_callback(function() {
})
//sub_state_close_2.set_drawer(draw_transition)

sub_state_close_1 = new menu_state()
sub_state_close_1.caption = "main-sub-start-close"
sub_state_close_1.set_duration(1.2)
sub_state_close_1.set_next(sub_state_close_2)
sub_state_close_1.set_updater(function(progress) {
})
sub_state_close_1.set_callback(function() {
})
//sub_state_close_1.set_drawer(draw_transition)

// 글자가 나타남
sub_state_open_3 = new menu_state()
sub_state_open_3.caption = "main-sub-exit-open-3"
sub_state_open_3.set_duration(1)

// 스포트라이트가 벌어짐
sub_state_open_2 = new menu_state()
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
sub_state_open_1 = new menu_state()
sub_state_open_1.caption = "main-sub-exit-open-1"
sub_state_open_1.set_duration(1.5)
sub_state_open_1.set_next(sub_state_open_2)
sub_state_open_1.set_updater(function(progress) {
})
sub_state_open_1.set_callback(function() {
})
sub_state_open_1.set_drawer(function() {
})

sub_state_intro = new menu_state()
sub_state_intro.caption = "main-sub-exit-intro"
sub_state_intro.set_duration(2)
sub_state_intro.set_next(sub_state_normal)
sub_state_intro.set_updater(function(progress) {
})
sub_state_intro.set_callback(function() {
})
sub_state_intro.set_drawer(function() {
	draw_set_color($ffffff)
	draw_set_halign(1)
	draw_set_valign(1)
	draw_text_transformed(normal_x, normal_y, "EXIT", 1, 1, title_angle)
	draw_set_color($821071)
	
	draw_set_color($ffffff)
})

var indic = "EXIT"
var sw = string_width(indic)
var sh = string_height(indic)
// 250, 90
normal_w = 235
normal_h = 75
normal_x = 573
normal_y = 915
title_angle = point_direction(0, 0, normal_w, -normal_h)
title_beta = 90 - title_angle
make_back_color = make_color_hsv(206, 230, 128)

mode_enter = sub_state_intro
__callback_open = sub_state_open_1
__callback_close = sub_state_close_1

