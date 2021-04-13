/// @description Create menu status
sub_state_normal.set_drawer(function() {
	if !surface_exists(corner_surface)
		regenerate_corner()

	refresh_corner(0.4)
	draw_surface_ext(corner_surface, corner_x_default, corner_y_default, 1, 1, image_angle, $ffffff, 1)
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

sub_state_intro_2 = new menu_state()
sub_state_intro_2.caption = "main-sub-exit-intro-2"
sub_state_intro_2.set_duration(0.5)
sub_state_intro_2.set_next(sub_state_normal)
sub_state_intro_2.set_updater(function(progress) {
})
sub_state_intro_2.set_callback(function() {
})
sub_state_intro_2.set_drawer(function() {
	if !surface_exists(corner_surface)
		regenerate_corner()

	var ratio = 1.4 - ease.inout_elastic(mode_ratio) * 1
	refresh_corner(ratio)
	draw_surface_ext(corner_surface, corner_x_default, corner_y_default, 1, 1, image_angle, $ffffff, 1)
})

sub_state_intro_1 = new menu_state()
sub_state_intro_1.caption = "main-sub-exit-intro-1"
sub_state_intro_1.set_duration(0.7)
sub_state_intro_1.set_next(sub_state_intro_2)
sub_state_intro_1.set_updater(function(progress) {
})
sub_state_intro_1.set_callback(function() {
})
sub_state_intro_1.set_drawer(function() {
	if !surface_exists(corner_surface)
		regenerate_corner()

	var ratio = 3 - ease.in_bounce(mode_ratio) * 1.6
	refresh_corner(ratio)
	draw_surface_ext(corner_surface, corner_x_default, corner_y_default, 1, 1, image_angle, $ffffff, 1)
})

make_back_color = function(hue) {
	return make_color_hsv(hue, 230, 128)
}

regenerate_corner = function() {
	corner_surface = surface_create(600, 300)
}

refresh_corner = function(progress) {
	surface_set_target(corner_surface)
	draw_clear(corner_color)
	draw_sprite_ext(sMainExit, 0, 150, 150, 1, 1, 0, $ffffff, 1)
	draw_set_color(0)
	draw_rectangle(0, 0, 300, 160 * progress, false)
	surface_reset_target()
}

// 250, 90
corner_surface = -1
corner_x_default = 365
corner_y_default = 805
corner_color = make_back_color(206)
corner_angle = point_direction(0, 0, 250, -90)
regenerate_corner()

var indic = "EXIT"
var sw = string_width(indic)
var sh = string_height(indic)

introduct_angle = corner_angle - 90 + 360
var itx = lengthdir_x(1, introduct_angle)
var ity = lengthdir_y(1, introduct_angle)

image_angle = corner_angle

mode_enter = sub_state_intro_1
__callback_open = sub_state_open_1
__callback_close = sub_state_close_1

