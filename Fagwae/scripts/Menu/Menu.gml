function Menu() {
	// Properties
	self.__child_focus = null
	self.__children = new List()

	// Member Attributes
	self.__opened = false
	self.__openable = true
	self.__transition = false
	self.__trans_mode = MENU_MODES.OPEN
	self.__trans_time = 0
	self.__trans_period = 0.4

	///@function do_update()
	self.do_update = null
	///@function do_draw()
	self.do_draw = null

	self.__x = null
	self.__y = null
	self.__w = null
	self.__h = null

	// Alias
	self.add_menu_item = method(self, add_menu_item)
	self.add_text = method(self, add_text)

	self.do_open = method(self, do_open)
	self.do_close = method(self, do_close)
	self.on_open = method(self, on_open)
	self.off_open = method(self, off_open)
	self.set_open = method(self, set_open)
	self.set_transition_duration = method(self, set_transition_duration)

	///@function child_run(predicate)
	self.child_run = function(predicate) {
		__children.foreach_all(predicate)
	}

	///@function get_size()
	self.get_size = function() {
		return __children.get_size()
	}

	///@function focus_child(child)
	self.focus_child = function(child) {
		__child_focus = child
	}

	///@function focus([target])
	self.focus = function() {
		if argument_count == 0
			if __parent != null
				with __parent
					focus_child(other)
		else
			focus_child(argument[0])
	}

	///@function focus_index(index)
	self.focus_index = function(index) {
		focus_child(__children.at(index))
	}

	///@function get_focus()
	self.get_focus = function() {
		return __child_focus
	}

	///@function do_update_logic()
	self.do_update_logic = function() {
		if do_update != null
			do_update()

		if __transition {
			if __trans_period <= __trans_time {
				if __trans_mode == MENU_MODES.OPEN {
					__opened = true
				} else if __trans_mode == MENU_MODES.CLOSE {
					__opened = false
				}

				__transition = false
				__trans_time = 0
			}

			__trans_time += delta_time * 0.000001
		}

		__children.foreach_all(function(Child) {
			with Child
				do_update_logic()
		})
	}
}

function MenuEntry() constructor {
	Menu()

	__parent = null
	__callback = null

	self.set_callback = method(self, set_callback)

	///@function execute()
	self.execute = function() {
		if __callback != null
			__callback()
	}
}

function MenuText(caption, x, y): MenuEntry() constructor {
	self.__caption = caption
	self.__x = x
	self.__y = y
	self.__h = 74

	static toString = function() {
		return __caption
	}
	
	self.do_draw = function() {
		draw_text(__x, __y, __caption)
	}
}

function add_menu_item(object) {
	__children.push_back(object)
	if is_struct(self)
		object.__parent = self
	else
		object.__parent = self.id
	if __child_focus == null
		__child_focus = object
	return object
}

function add_text(caption, x, y) {
	return add_menu_item(new MenuText(caption, x, y))
}

///@function do_open()
function do_open() {
	if __openable {
		__trans_mode = MENU_MODES.OPEN
		__transition = true
	}
}

///@function do_close()
function do_close() {
	__trans_mode = MENU_MODES.CLOSE
	__transition = true
}

///@function on_open()
function on_open() {
	__openable = true
}

///@function off_open()
function off_open() {
	__openable = false
}

///@function set_transition_duration(time)
function set_transition_duration(time) {
	__trans_period = time
}

///@function set_callback(function)
function set_callback(callable) {
	__callback = callable
}

///@function set_open(flag)
function set_open(flag) {
	__opened = flag
}
