/// @function KeyboardAnchor(keys)
function KeyboardAnchor(keys) constructor {
	this.my_keys = new List(keys)
	this.size = self.my_keys.get_size()


	/// @function check()
	static check = function() {
		return my_keys.any_of(0, size, keyboard_check)
	}


	/// @function check_pressed()
	static check_pressed = function() {
		return my_keys.any_of(0, size, keyboard_check_pressed)
	}


	/// @function check_released()
	static check_released = function() {
		return my_keys.any_of(0, size, keyboard_check_released)
	}
}


/// @function GamepadAnchor(keys)
function GamepadAnchor(keys) constructor {
	this.my_keys = new List(keys)
	this.size = self.my_keys.get_size()


	/// @function check()
	static check = function() {
		return my_keys.any_of(0, size, gamepad_button_check)
	}


	/// @function check_pressed()
	static check_pressed = function() {
		return my_keys.any_of(0, size, gamepad_button_check_pressed)
	}


	/// @function check_released()
	static check_released = function() {
		return my_keys.any_of(0, size, gamepad_button_check_released)
	}
}



/// @function GamepadAnchor(keyboard_keys, gamepad_keys)
function GamepadAnchor(kbkeys, gpkeys) constructor {
	this.kb_set = new KeyboardAnchor(kbkeys)
	if GAMEPAD_AVAILABLE and 1 < argument_count
		this.gp_set = new GamepadAnchor(gpkeys)
	else
		this.gp_set = null


	/// @function check()
	static check = function() {
		if !is_null(gp_set)
			return kb_set.check() or gp_set.check()
		else
			return kb_set.check()
	}


	/// @function check_pressed()
	static check_pressed = function() {
		if !is_null(gp_set)
			return kb_set.check_pressed() or gp_set.check_pressed()
		else
			return kb_set.check_pressed()
	}


	/// @function check_released()
	static check_released = function() {
		if !is_null(gp_set)
			return kb_set.check_released() or gp_set.check_released()
		else
			return kb_set.check_released()
	}
}


/// @function seconds(time)
function seconds(time) {
	return time * GAME_FPS
}


/// @function realforce(speed)
function realforce(speed) {
	return speed / GAME_FPS
}

