var scroll_value = ui_lerp_filter(value, minimum, maximum)
var scroll_x = scroll_value * ui_width

cell.x = x + scroll_x
