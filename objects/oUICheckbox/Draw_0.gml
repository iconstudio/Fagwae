if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

var hovered = false
if global.ui_top == id {
	hovered = true
}

if value && (!pressed || !hovered)
	draw_sprite_ext(sCheckBox, 0, x, y, 1, 1, 0, $ffffff, image_alpha)

if !value || (hovered && value && !pressed)
	draw_sprite_ext(sCheckBox, 1, x, y, 1, 1, 0, $ffffff, image_alpha)

if hovered && !value && !pressed
	draw_sprite_ext(sCheckBox, 2, x, y, 1, 1, 0, $ffffff, image_alpha)

if hovered && !value && pressed
	draw_sprite_ext(sCheckBox, 3, x, y, 1, 1, 0, $ffffff, image_alpha)

if hovered && value && pressed
	draw_sprite_ext(sCheckBox, 4, x, y, 1, 1, 0, $ffffff, image_alpha)

if image_alpha != 0 and caption != "" {
	draw_set_alpha(image_alpha)
	draw_set_color(image_blend)
	draw_set_font(fontNormal)
	draw_set_halign(0)
	draw_set_valign(1)
	draw_text(x + 40, y + 10, caption)
	draw_set_color($ffffff)
	draw_set_alpha(1)
}
