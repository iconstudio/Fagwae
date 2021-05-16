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
		static checker = function(button) {
			return gamepad_button_check(global.gamepad_index, button)
		}


		if global.gamepad_index != -1
			return my_keys.any_of(0, size, checker)
		else return false
	}


	/// @function check_pressed()
	static check_pressed = function() {
		static checker = function(button) {
			return gamepad_button_check_pressed(global.gamepad_index, button)
		}


		if global.gamepad_index != -1
			return my_keys.any_of(0, size, checker)
		else return false
	}


	/// @function check_released()
	static check_released = function() {
		static checker = function(button) {
			return gamepad_button_check_released(global.gamepad_index, button)
		}


		if global.gamepad_index != -1
			return my_keys.any_of(0, size, checker)
		else return false
	}
}


/// @function GeneralInputAnchor(keyboard_keys, [gamepad_keys])
function GeneralInputAnchor(kbkeys, gpkeys) constructor {
	this.kb_set = new KeyboardAnchor(kbkeys)
	if gamepad_is_supported() and !is_null(gpkeys)
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


/// @function JoystickAnchor(type)
function JoystickAnchor(dir) constructor {
	this.key = dir
	this.pressed = false


	/// @function get_value()
	static get_value = function() {
		static checker = function(button) {
			return gamepad_axis_value(global.gamepad_index, key)
		}


		if global.gamepad_index != -1
			return checker()
		else return 0
	}


	/// @function check()
	static check = function() {
		return (get_value() != 0)
	}


	/// @function check_pressed()
	static check_pressed = function() {
		var value = get_value()
		if value != 0 and !pressed {
			if 0.5 < abs(value) {
				pressed = true
				return true
			}
		}

		return false
	}


	/// @function check_released()
	static check_released = function() {
		var value = get_value()
		if pressed {
			if abs(value) <= 0.5 {
				pressed = false
				return true
			}
		}

		return false
	}
}


/// @function fagwae_score_add(score)
function fagwae_score_add(value) {
	with oGameScore
		add(value)
}


/// @function seconds(time)
function seconds(time) {
	return time * GAME_FPS
}


/// @function realforce(speed)
function realforce(speed) {
	return speed / GAME_FPS
}

