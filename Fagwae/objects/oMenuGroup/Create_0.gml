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


choice_wrap = function(index) {
	var Size = menu_set.get_size()
	if index < 0 {
		return Size + index
	} elif Size <= index {
		return index - Size + 1
	} else {
		return index
	}
}


select = function(index) {
	selection = choice_wrap(index)

	return self
}


set_fade_duration = function(time) {
	fade_period = time

	return self
}


