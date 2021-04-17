function Menu() {
	this.caption = "Default menu item"

	// Properties
	this.children = new List()
	this.child_focus = null
	this.child_choice = null
	this.child_first = null
	this.child_last = null

	this.mode_enter = null
	this.mode = null
	this.mode_ratio = 0


	this.toString = function() {
		return caption
	}


	///@function get_size()
	this.get_size = function() {
		return children.get_size()
	}


	///@function focus_child(child)
	this.focus_child = function(child) {
		child_focus = child
	}


	///@function focus_index(index)
	this.focus_index = function(index) {
		focus_child(children.at(index))
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


	///@function finish()
	static finish = function() {
		time = period
		menu_mode_change(next)
	}
}


///@function menu_mode_change(mode)
function menu_mode_change(newmode) { print(newmode)
	var prior = this.mode
	if prior != newmode {
		if !is_null(prior) and !is_null(prior.callback)
			prior.callback()

		this.mode = newmode

		if !is_null(newmode) {
			newmode.time = 0
			mode_ratio = 0
			if !is_null(newmode.init)
				newmode.init()
		}
	}
}


function menu_mode_update(mode) {
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
	children.push_back(object)
	if is_struct(this)
		object.parent = this
	else
		object.parent = this.id
	if child_focus == null
		child_focus = object
	return object
}
