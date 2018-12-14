/// @description Setting mouse to gui coordinates

mouse_gui_x = device_mouse_x_to_gui(0)
mouse_gui_y = device_mouse_y_to_gui(0)
global.ui_top = ui_get_top(device_mouse_x(0), device_mouse_y(0), oUIComponent)

if gamepad_index != -1 and global.padmeter != 0 {
	gamepad_set_vibration(gamepad_index, global.padmeter, global.padmeter)
	global.padmeter -= global.padmeter * 0.125
}
