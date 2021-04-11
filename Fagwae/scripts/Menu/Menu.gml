function Menu() {
	this.caption = "Default menu item"

	// Properties
	this.child_focus = null
	this.child_choice = null
	this.__children = new List()

	this.__callback_open = null
	this.__callback_close = null

	this.mode_enter = null
	this.mode_exit = null
	this.mode = null
	this.mode_ratio = 0
	this.transitioning = false
	this.focus_time = 0
	this.focus_period = 1
	this.unfocus_time = 0
	this.unfocus_period = 1

	this.toString = function() {
		return caption
	}

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
		if !is_null(__callback_open)
			return __callback_open()
	}

	///@function do_close()
	this.do_close = function() {
		if !is_null(__callback_close)
			return __callback_close()
	}

	///@function focus_child(child)
	this.focus_child = function(child) {
		child_focus = child
	}

	///@function focus_index(index)
	this.focus_index = function(index) {
		focus_child(__children.at(index))
	}

	///@function get_focus()
	this.get_focus = function() {
		return child_focus
	}
}


function menu_state() constructor {
	this.caption = ""
	this.time = 0
	this.period = 1
	this.next = null

	this.init = null
	this.update = null
	this.callback = null
	this.draw = null

	///@function toString()
	static toString = function() {
		return caption
	}

	///@function set_duration(time)
	static set_duration = function(time) {
		period = time
	}

	///@function set_next(state)
	static set_next = function(state) {
		next = state
	}

	///@function set_initializer(function)
	static set_initializer = function(callable) {
		init = method(other, callable)
	}

	///@function set_updater(function)
	static set_updater = function(callable) {
		update = method(other, callable)
	}

	///@function set_drawer(function)
	static set_drawer = function(callable) {
		draw = method(other, callable)
	}

	///@function set_callback(function)
	static set_callback = function(callable) {
		callback = method(other, callable)
	}
}


function menu_mode_change(mode) { print(mode)
	var prior = this.mode
	if prior != mode {
		if !is_null(prior) and !is_null(prior.callback)
			prior.callback()

		this.mode = mode

		if !is_null(mode) {
			mode.time = 0
			if !is_null(mode.init)
				mode.init()
		}
	}
}


function menu_mode_update() {
	if !is_null(mode) {
		var phase_ratio = mode.time / mode.period
		mode_ratio = phase_ratio

		var predicate = mode.update
		if !is_null(predicate)
			predicate(phase_ratio)

		if phase_ratio < 1 {
			mode.time += Delta

			if mode.period < mode.time // limit to 1
				mode.time = mode.period
		} else {
			if !is_null(mode.next)
				menu_mode_change(mode.next)
		}
	}
}


function menu_mode_draw() {
	if !is_null(mode) {
		if !is_null(mode.draw)
			mode.draw()
	}
}


function add_menu_item(object) {
	__children.push_back(object)
	if is_struct(this)
		object.parent = this
	else
		object.parent = this.id
	if child_focus == null
		child_focus = object
	return object
}
