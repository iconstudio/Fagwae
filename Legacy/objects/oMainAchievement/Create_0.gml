/// @description Initialization
if global.achievement_count <= 0
	show_debug_message("There is no achievement!")

draw_mode = 0
appear_time = 0
appear_period = seconds(0.5)
disappear_time = 0
disappear_period = seconds(0.6)

scroll = 0
item_height = 100
for (var i = 0; i < global.achievement_count; ++i) {
	item_time[i] = 0
}
item_period = seconds(0.06)
item_show_time = 0
item_show_gap_period = seconds(0.03)

content_height = item_height * global.achievement_count
content_draw_x_start = 80
//content_draw_x_end = screen_width - 90
content_draw_y_start = 100
content_draw_y_end = screen_height - 90
viewer_height = screen_height - 190 // screen_height - (100 + 90)
