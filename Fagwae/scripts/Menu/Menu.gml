function Menu() {
	__parent = null
	__child_focus = null
	__children = []
	__callback = null

	__opened = false

	__x = 0
	__y = 0
	__w = 0
	__h = 0
}

function MenuEntry() constructor {
	Menu()
}

function MenuText(caption): MenuEntry() constructor {
	self.caption = caption
}

function add_entry(object) {
	array_push(__children, object)
	object.__parent = self
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
	focus_child(__children[index])
}

///@function set_callback(function)
function set_callback(callable) {
	__callback = callable
}

///@function set_open(flag)
function set_open(flag) {
	__opened = flag
}
