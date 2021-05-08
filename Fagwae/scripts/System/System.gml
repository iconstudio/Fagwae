/// @function fag_input(keys)
function fag_input(keys) constructor {
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


function delta_scale(scale) {
	global.__delta_scale = scale
}
