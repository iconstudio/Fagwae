/// @description Initialization
predicate = null


deriven_state = null
parent = null
next = null
before = null


/// draw(x, y) -> next(x, y)
this.draw = null


set_layer = function(target_state) {
	deriven_state = target_state
}


attach_to = function(target_state) {
	if is_null(target_state) {
		if is_null(parent) { // do nothing
		} else {
			target_state.dettach(self)
		}
	} else {
		if !is_null(parent) {
			parent.dettach(self)
		}
		target_state.attach(self)
	}
}
