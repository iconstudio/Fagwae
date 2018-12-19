/// @description Creating a setting panel
if pressed {
	pressed = false

	if oMainMenu.draw_mode > 0 or dmode != 0
		exit

	var button_parent = id, button_about, button_copyright, button_instruction
	if true /*global.ui_top == id*/ {
		with oGlobal {
			other.pane_instance = ui_create(0, 0, oUIWindow, "ZUI")
			other.pane_instance.callback_parent = other.id
			var _black = ui_create(0, 0, oUIBlack, "ZUI_Below")

			with other.pane_instance {
				ui_set_size(420, 800)
				event_user(0)
				ui_take_center()
				black = _black

				button_about = ui_create(20, 5, oUIButtonPane, "ZUI_Above")
				button_copyright = ui_create(150, 5, oUIButtonPane, "ZUI_Above")
				button_instruction = ui_create(280, 5, oUIButtonPane, "ZUI_Above")
				with button_about {
					ui_set_size(120, 60)
					event_user(0)
					caption = "정보"
					selected = true
					button_parent.button_focus = id
					button_prev = button_instruction
					button_next = button_copyright
					callback = script_callback_about
					script_callback_about()
				}

				with button_copyright {
					ui_set_size(120, 60)
					event_user(0)
					caption = "크레딧"
					button_prev = button_about
					button_next = button_instruction
					callback = script_callback_credit
				}

				with button_instruction {
					ui_set_size(120, 60)
					event_user(0)
					caption = "설명"
					button_prev = button_copyright
					button_next = button_about
					callback = script_callback_about
				}

				with ui_create(0, 0, oUIButton, "ZUI_Above") {
					ui_set_size(96, 32)
					event_user(0)
					ui_take_center()
					y = ui_parent.y + ui_get_height(ui_parent) - 40
					caption = "닫기"
					callback = script_callback_close_help
				}
			}
		} // #with oGlobal
		dmode = 1
	}
}
