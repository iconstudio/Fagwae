function Menu() {
	// Properties
	this.child_focus = null
	this.child_choice = null
	this.__children = new List()

	this.__callback = null

	this.mode = MENU_STATES.NOTHING
	this.mode_ratio = 0

	this.__openable = true
	this.transitioning = false
	this.tr_open_1_time = 0
	this.tr_open_1_period = 1
	this.tr_open_2_time = 0
	this.tr_open_2_period = 1
	this.tr_close_time = 0
	this.tr_close_period = 1.7

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
		if __callback != null
			__callback()

		if __openable {
			parent.child_choice = self
			mode = MENU_STATES.OPENING_1
			transitioning = true
		}
	}

	///@function do_close()
	this.do_close = function() {
		mode = MENU_STATES.CLOSING
		transitioning = true
	}

	///@function set_callback(function)
	this.set_callback = function(callable) {
		__callback = callable
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
	time = 0
	period = 1
	next = null

	init = null
	update = null
	callback = null
	draw = null

	///@function set_duration(time)
	this.set_initializer = function(time) {
		period = time
	}

	///@function set_next(state)
	this.set_next = function(state) {
		init = state
	}

	///@function set_initializer(function)
	this.set_initializer = function(callable) {
		init = callable
	}

	///@function set_updater(function)
	this.set_updater = function(callable) {
		update = callable
	}

	///@function set_drawer(function)
	this.set_drawer = function(callable) {
		draw = callable
	}

	///@function set_callback(function)
	this.set_callback = function(callable) {
		callback = callable
	}
}


function menu_mode_change(mode) { print(mode)
	var prior = this.mode
	if prior != mode {
		if prior != null and prior.callback != null
			prior.callback()
		this.mode = mode
		if mode != null {
			mode.time = 0
			if mode.init != null
				mode.init()
		}
	}
}


function menu_mode_update() {
	if mode != null {
		var phase_ratio = mode.time / mode.period
		var predicate = mode.update
		if predicate != null
			predicate(phase_ratio)

		if phase_ratio < 1 {
			mode.time += Delta

			if mode.period < mode.time // limit to 1
				mode.time = mode.period
		} else {
			if mode.next != null
				menu_mode_change(mode.next)
		}

		mode_ratio = phase_ratio
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
