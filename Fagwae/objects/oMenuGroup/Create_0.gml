/// @description Initialization
mode = MENU_STATUSES.NORMAL
fade_time = 0
fade_period = 0.1


draw_method = DepthMenuPipeVertical
draw = function(dx, dy) {
	draw_method(x + dx, y + dy)
}


draw_set = new List()
menu_set = new List()
selection = 0


apply = function(item) {
	draw_set.push_back(item)
	item.parent = self
	return self
}


join = function(item) {
	apply(item)

	var Index = menu_set.get_size()
	menu_set.push_back(item)
	item.order = Index
	return self
}
