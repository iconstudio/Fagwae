/// @description Initialization
parent = null


mode = MENU_STATUSES.NORMAL
fade_time = 0
fade_period = 0.1


children = new List()
child_first = null
child_last = null
selection = null


attach = function(menu) {
	parent = menu
}


join = function(item) {
	item.parent = self
	children.push_back(item)


	if is_null(child_first) {
		child_first = item
		child_last = item
		item.before = item
	} else {
		child_last.next = item
		item.before = child_last

		child_last = item
	}
}


disjoin = function(item) {
	if item.parent == self {
		item.parent = null
		children.remove(0, children.get_size(), item)


		var Before = item.before, Next = item.next
		if item == child_first {
			if !is_null(Next)
				child_first = Next
			else
				child_first = null
		}
		if item == child_last {
			if !is_null(Before)
				child_last = Before
			else
				child_last = null
		}


		if !is_null(Before)
			Before.next = Next
		if !is_null(Next)
			Next.before = Before
	}
}


draw = function(x, y) {
	var child, draw_pos
	for (child = child_first; !is_null(child); child = child.next) {
		draw_pos = child.draw(x, y)
		x += draw_pos[0]
		y += draw_pos[1]
	}
}
