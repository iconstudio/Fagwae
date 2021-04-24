function FiniteStateMachine() {
	this.mode = null
}


function Astate() constructor {
	this.caption = ""
	this.time = 0
	this.period = 1
	this.next = null

	this.init = null
	this.onUpdate = null
	this.callback = null
	this.onDraw = null

	/// @function toString()
	static toString = function() {
		return caption
	}


	/// @function set_duration(time)
	static set_duration = function(time) {
		period = time
	}


	/// @function set_next(state)
	static set_next = function(state) {
		next = state
	}


	/// @function set_initializer(function)
	static set_initializer = function(callable) {
		init = method(other, callable)
	}


	/// @function set_updater(function)
	static set_updater = function(callable) {
		onUpdate = method(other, callable)
	}


	/// @function set_drawer(function)
	static set_drawer = function(callable) {
		onDraw = method(other, callable)
	}


	/// @function set_callback(function)
	static set_callback = function(callable) {
		callback = method(other, callable)
	}


	/// @function update()
	static update = function() {
		var phase_ratio = time / period
		if !is_null(onUpdate)
			onUpdate()

		if phase_ratio < 1 {
			time += Delta

			if period < time // limit to 1
				time = period
			return phase_ratio
		} else {
			if !is_null(next)
				return phase_ratio
		}
	}


	/// @function draw()
	static draw = function() {
		if !is_null(onDraw)
			onDraw()
	}


	/// @function finish()
	static finish = function() {
		time = period
	}
}


/// @function Astate_goto(mode)
function Astate_goto(newmode) { print(newmode)
	var prior = this.mode
	if prior != newmode {
		if !is_null(prior) and !is_null(prior.callback)
			prior.callback()

		this.mode = newmode

		if !is_null(newmode) {
			newmode.time = 0
			if !is_null(newmode.init)
				newmode.init()
		}
	}
}

