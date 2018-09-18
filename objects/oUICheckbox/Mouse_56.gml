if pressed {
	pressed = false
	if global.ui_top == id {
		value = !value
		if callback >= 0
			script_execute(callback, id, value)
	}
}

