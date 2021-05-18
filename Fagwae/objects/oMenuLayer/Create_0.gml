/// @description Initialization
parent = null


mode = MENU_STATUSES.NORMAL
fade_time = 0
fade_period = 0.1


draw_method = DepthMenuPipeVertical
draw_set = new List()
menu_set = new List()
selection = 0


attach = function(menu) {
	parent = menu
}


apply = function(item) {
	draw_set.push_back(item)
	item.parent = self
}


join = function(item) {
	apply(item)

	var Index = menu_set.get_size()
	menu_set.push_back(item)
	item.order = Index


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


draw = function(x, y) {
	var child, draw_pos
	for (child = child_first; !is_null(child); child = child.next) {
		draw_pos = child.draw(x, y)
		x += draw_pos[0]
		y += draw_pos[1]
	}
}
