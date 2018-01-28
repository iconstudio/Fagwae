/// @description Drawing

if !surface_exists(back_surface)
	event_user(0)

if y < 0 {
	draw_set_color(0)
	draw_rectangle(0, y + screen_height, screen_width, screen_height, false)
}

event_user(2)
