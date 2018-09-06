/// @description ui_show_popup(title, caption, [height], [width])
/// @param title string
/// @param caption string
/// @param [height] real
/// @param [width] real

var _width, _height
if argument_count > 2 {
	_width = argument[2]
	if argument_count > 3
		_height = argument[3]
	else
		_height = round(_width * 16 / 9)
} else {
	_width = 450
	_height = 800
}


with oGlobal {
	var _black = ui_create(0, 0, oUIBlack, "ZUI_Below")

	with ui_create(ui_get_width() * 0.5, ui_get_height() * 0.5, oUIWindow, "ZUI") {
		ui_set_size(_width, _height)
		black = _black

		with ui_create(0, 0, oUIWindowCaption, "ZUI_Above") {
			caption = argument[0]
		}
	
		with ui_create(ui_get_width() * 0.5, ui_get_height() * 0.5 - 8, oUILabel, "ZUI_Above") {
			caption = argument[1]
		}

		with ui_create(ui_get_width() * 0.5, ui_get_height() - 26, oUIButton, "ZUI_Above") {
			ui_set_size(96, 32)
			caption = "확인"
			callback = ui_popup_close
		}
	}
}
