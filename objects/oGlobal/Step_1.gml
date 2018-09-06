/// @description Setting mouse to gui coordinates

mouse_gui_x = device_mouse_x_to_gui(0)
mouse_gui_y = device_mouse_y_to_gui(0)
global.ui_top = ui_get_top(mouse_gui_x, mouse_gui_y, oUIComponent)

if global.ui_top != noone and current_time mod 10 < 2 {
	show_debug_message(object_get_name(global.ui_top.object_index))
}
