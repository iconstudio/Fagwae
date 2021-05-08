/// @function Promise(trigger)
function Promise(target) constructor {
	this.target = target
	this.result = null

	static get = function() {
		return result
	}
}


function Trigger(duration, data, predicate) constructor {
	this.time = 0
	this.period = duration
	this.data = data
	this.promise_type = Promise
	this.promise = null
	this.predicate = predicate


	static clear = function() {
		time = 0
		if !is_null(promise) {
			promise.result = null
		}
	}


	static update = function() {
		var Ratio = time / period
		if time < period {
			time += Delta
		}
		return Ratio
	}


	static execute = function() {
		var Result = predicate()
		if !is_null(promise) {
			promise.result = Result
		}
		return Result
	}


	static make_promise = function() {
		if is_null(promise)
			promise = new promise_type(self)
		return promise
	}
}


/// @function InstanceCreatePromise(trigger)
function InstanceCreatePromise(target): Promise(target) constructor {
}

/*
/// @function InstanceCreateTrigger(object, layer, x, y)
function InstanceCreateTrigger(object, layer, x, y): Trigger([object, layer, x, y]) constructor {
	this.promise_type = InstanceCreatePromise


	this.predicate = function() {
		var Result = instance_create_layer(data[3], data[2], data[1], data[0])
		if !is_null(promise) {
			promise.result = Result
		}
	}
}
