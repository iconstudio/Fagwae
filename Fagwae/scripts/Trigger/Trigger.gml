/// @function Promise(trigger)
function Promise(target) constructor {
	this.target = target

	this.init = null
	this.dest = null
	this.result = null

	static get = function() {
		return result
	}
}


function Trigger(data) constructor {
	this.data = data
	this.promise_type = Promise
	this.promise = null

	this.predicate = null


	static make_promise = function() {
		if is_null(promise)
			promise = new promise_type(self)
		return promise
	}
}


/// @function InstanceCreatePromise(trigger)
function InstanceCreatePromise(target): Promise(target) constructor {
}


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
