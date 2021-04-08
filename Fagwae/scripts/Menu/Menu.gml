function Menu() {
	// Properties
	this.__child_focus = null
	this.__child_choice = null
	this.__children = new List()

	// Member Attributes
	this.__opened = false
	this.__openable = true
	this.__transition = false
	this.__trans_mode = MENU_MODES.OPEN
	this.__trans_time = 0
	this.__trans_period = 0.4

	this.__callback = null
	///@function do_update()
	this.do_update = null
	///@function do_draw()
	this.do_draw = null

	this.__x = null
	this.__y = null
	this.__w = 0
	this.__h = 0

	// Alias
	this.add_menu_item = method(this, add_menu_item)
	this.add_text = method(this, add_text)

	///@function child_run(predicate)
	this.child_run = function(predicate) {
		__children.foreach_all(predicate)
	}

	///@function get_size()
	this.get_size = function() {
		return __children.get_size()
	}

	///@function do_open()
	this.do_open = function() {
		if __openable {
			__trans_mode = MENU_MODES.OPEN
			__transition = true
		}
	}

	///@function do_close()
	this.do_close = function() {
		__trans_mode = MENU_MODES.CLOSE
		__transition = true
	}

	///@function execute()
	this.execute = function() {
		if __callback != null
			__callback()
	}

	///@function on_open()
	this.on_open = function() {
		__openable = true
	}

	///@function off_open()
	this.off_open = function() {
		__openable = false
	}

	///@function set_transition_duration(time)
	this.set_transition_duration = function(time) {
		__trans_period = time
	}

	///@function set_callback(function)
	this.set_callback = function(callable) {
		__callback = callable
	}

	///@function set_open(flag)
	this.set_open = function(flag) {
		__opened = flag
	}

	///@function focus_child(child)
	this.focus_child = function(child) {
		__child_focus = child
	}

	///@function focus([target])
	this.focus = function() {
		if argument_count == 0
			if __parent != null
				__parent.focus_child(self)
		else
			focus_child(argument[0])
	}

	///@function focus_index(index)
	this.focus_index = function(index) {
		focus_child(__children.at(index))
	}

	///@function get_focus()
	this.get_focus = function() {
		return __child_focus
	}

	///@function select(child)
	this.select = function(child) {
		if child == null {
			if __child_choice != null {
				__child_choice.do_close()
			}
			__child_choice = null

			return this
		} else {
			child.execute()
			if child.__openable and 0 < child.get_size() {
				__child_choice = child
				child.do_open()

				return child
			}

			return this
		}
	}

	///@function deselect()
	this.deselect = function() {
		if __parent != null
			return __parent.select(null)
		else
			throw "No parent!"
	}

	///@function get_selection()
	this.get_selection = function() {
		return __child_choice
	}

	///@function select_index(index)
	this.select_index = function(index) {
		return select(__children.at(index))
	}

	///@function do_update_logic()
	this.do_update_logic = function() {
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

			__trans_time += Delta
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

}

function MenuText(caption, x, y): MenuEntry() constructor {
	this.__caption = caption
	this.__x = x
	this.__y = y
	this.__h = 74

	static toString = function() {
		return __caption
	}
	
	this.do_draw = function() {
		draw_text(__x, __y, __caption)
	}
}

function add_menu_item(object) {
	__children.push_back(object)
	if is_struct(this)
		object.__parent = this
	else
		object.__parent = this.id
	if __child_focus == null
		__child_focus = object
	return object
}

function add_text(caption, x, y) {
	return add_menu_item(new MenuText(caption, x, y))
}
