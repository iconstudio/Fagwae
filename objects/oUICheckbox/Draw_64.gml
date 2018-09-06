
var mouseOn = false
if global.ui_top == id {
	mouseOn = true
}

if value && (!pressed || !mouseOn)
	draw_sprite_ext(sCheckBox, 1, -1, -1, 1, 1, 0, $ffffff, 1)

if mouseOn || !value
	draw_sprite_ext(sCheckBox, 0, -1, -1, 1, 1, 0, $ffffff, 1)

if mouseOn && !value && pressed
	draw_sprite_ext(sCheckBox, 2, -1, -1, 1, 1, 0, $ffffff, 1)

if mouseOn && value && pressed
	draw_sprite_ext(sCheckBox, 3, -1, -1, 1, 1, 0, $ffffff, 1)
