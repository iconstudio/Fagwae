function Menu() {
	this.caption = "Default menu item"

	// Properties
	this.children = new List()
	this.child_focus = null
	this.child_choice = null
	this.child_first = null
	this.child_last = null

	FiniteStateMachine()
	this.mode_enter = null


	this.toString = function() {
		return caption
	}


	this.push = function(entity) {
		entity.parent = id
		children.push_back(entity)

		if is_null(child_first) {
			child_first = entity
			child_last = entity
		} else {
			child_first.before = entity
			child_last.next = entity
			child_last = entity
		}
		
		return entity
	}


	this.menu_child_execute = function(callable) {
		children.foreach_all(callable)
	}


	this.get_size = function() {
		return children.get_size()
	}


	this.focus_child = function(child) {
		child_focus = child
	}


	this.focus_index = function(index) {
		focus_child(children.at(index))
	}


	this.get_focus = function() {
		return child_focus
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
