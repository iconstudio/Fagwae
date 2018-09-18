if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

if global.ui_top != id
	ui_hover = false

var color = $999999
//global.ui_top == id or selected
if (global.ui_top == id and !selected) or (global.ui_top == id and !pressed and ui_hover) or (global.ui_top != id and !pressed and selected)  {
	color = $ffffff
}

draw_set_alpha(image_alpha)
draw_set_halign(1)
draw_set_valign(0)
draw_set_color(color)
if selected
	draw_set_font(fontBold)
else
	draw_set_font(fontNormal)
draw_text(x + ui_width * 0.5, y + ui_height * 0.2, caption)
draw_set_font(fontRetro)

if color == $ffffff and selected {
	draw_set_color($d77800)
	draw_rectangle(x + 4, y + ui_height * 0.9, x + ui_width - 4, y + ui_height, false)
}


