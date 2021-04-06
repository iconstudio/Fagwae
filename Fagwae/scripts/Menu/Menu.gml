function Menu() {
	// Properties
	self.__child_focus = null
	self.__children = new Vector()

	// Member Attributes
	self.__opened = false
	self.__openable = true
	self.__transition = false
	self.__trans_mode = MENU_MODES.OPEN
	self.__trans_time = 0
	self.__trans_period = 0.4

	self.__x = 0
	self.__y = 0
	self.__w = 0
	self.__h = 0

	// Alias
	self.focus_child = method(self, focus_child)
	self.focus_index = method(self, focus_index)
	self.focus = method(self, focus)
	self.get_focus = method(self, get_focus)

	self.add_entry = method(self, add_entry)
	self.add_text = method(self, add_text)

	self.do_open = method(self, do_open)
	self.on_open = method(self, on_open)
	self.off_open = method(self, off_open)
	self.set_open = method(self, set_open)
	self.set_transition_duration = method(self, set_transition_duration)

	// Methods
	self.do_update = function() {
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

			__trans_time++
		}

		var Len = __children.size()
		if 0 < Len {
			var i, Child
			for (i = 0; i < Len; ++i) {
				Child = __children.at(i)
				if Child
					with Child
						do_update()
			}
		}
	}
}

function MenuEntry() constructor {
	Menu()

	__parent = null
	__callback = null

	self.set_callback = method(self, set_callback)
}

function MenuText(caption): MenuEntry() constructor {
	self.__caption = caption

	static toString = function() {
		return __caption
	}
}

function add_entry(object) {
	__children.push_back(object)
	if is_struct(self)
		object.__parent = self
	else
		object.__parent = self.id
	if __child_focus == null
		__child_focus = object
	return object
}

function add_text(caption) {
	return add_entry(new MenuText(caption))
}

///@function focus_child(child)
function focus_child(child) {
	__child_focus = child
}

///@function focus([target])
function focus() {
	if argument_count == 0
		if __parent != null
			with __parent
				focus_child(other)
	else
		focus_child(argument[0])
}

function focus_index(index) {
	focus_child(__children.at(index))
}

///@function do_open()
function do_open() {
	if __openable
		__opened = true
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

///@function get_focus()
function get_focus() {
	return __child_focus
}
