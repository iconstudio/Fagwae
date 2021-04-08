/// @function fag_input(keys)
function fag_input(keys) constructor {
	self.my_keys = new List(keys)
	self.size = self.my_keys.get_size()

	/// @function check()
	static check = function() {
		return my_keys.any_of(0, size, function(Key) {
			return keyboard_check(Key)
		})
	}

	/// @function check_pressed()
	static check_pressed = function() {
		return my_keys.any_of(0, size, function(Key) {
			return keyboard_check_pressed(Key)
		})
	}

	/// @function check_released()
	static check_released = function() {
		return my_keys.any_of(0, size, function(Key) {
			return keyboard_check_released(Key)
		})
	}
}
