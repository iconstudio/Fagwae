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
				ui_take_center()
				black = _black

				with ui_create(0, 0, oUIWindowCaption, "ZUI_Above") {
					caption = "설정"
				}

				with ui_create(0, 40, oUILabel, "ZUI_Above") {
					caption = "3423423 5sdfsdfsdfs테스트 테스트 문자 테스트합니다."
				}
				
				with ui_create(10, 40, oUIButton, "ZUI_Above") {
					ui_set_size(96, 32)
					caption = "버튼 1"
					callback = ui_setting_close
				}
				
				with ui_create(10, 80, oUIButton, "ZUI_Above") {
					ui_set_size(96, 32)
					caption = "버튼 2"
					callback = ui_setting_close
				}

				with ui_create(0, 0, oUIButton, "ZUI_Above") {
					ui_set_size(96, 32)
					ui_take_center()
					y = ui_parent.y + ui_get_height(ui_parent) - 26
					caption = "확인"
					callback = ui_setting_close
				}
			}
		} // #with oGlobal
		dmode = 1
	}
}
