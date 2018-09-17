/// @description Creating a setting panel

if pressed and dmode == 0 {
	pressed = false

	if global.ui_top == id {
		with oGlobal {
			other.pane_instance = ui_create(0, 0, oUIWindow, "ZUI")
			other.pane_instance.callback_parent = other.id
			var _black = ui_create(0, 0, oUIBlack, "ZUI_Below")

			with other.pane_instance {
				ui_set_size(420, 800)
				event_user(0)
				ui_take_center()
				black = _black

				with ui_create(0, 0, oUIWindowCaption, "ZUI_Above") {
					caption = "설정"
				}

				with ui_create(20, 40, oUILabel, "ZUI_Above") {
					halign = 0
					ui_label_set_caption("효과음 음량")
				}
				with ui_create(0, 0, oUISlider, "ZUI_Above") {
					ui_set_size(300, 16)
					event_user(0)
					ui_take_center()
					y = ui_parent.y + 70
					minimum = 0
					maximum = 10
					value = global.setting_sfx
					callback = -1
				}

				with ui_create(20, 100, oUILabel, "ZUI_Above") {
					halign = 0
					ui_label_set_caption("음악 음량")
				}
				with ui_create(0, 0, oUISlider, "ZUI_Above") {
					ui_set_size(300, 8)
					event_user(0)
					ui_take_center()
					y = ui_parent.y + 130
					minimum = 0
					maximum = 10
					value = global.setting_music
					callback = -1
				}

				with ui_create(10, 300, oUIButton, "ZUI_Above") {
					ui_set_size(96, 32)
					event_user(0)
					caption = "버튼 2"
					callback = ui_setting_close
				}

				with ui_create(0, 0, oUIButton, "ZUI_Above") {
					ui_set_size(96, 32)
					event_user(0)
					ui_take_center()
					y = ui_parent.y + ui_get_height(ui_parent) - 40
					caption = "확인"
					callback = ui_setting_close
				}
			}
		} // #with oGlobal
		dmode = 1
	}
}
