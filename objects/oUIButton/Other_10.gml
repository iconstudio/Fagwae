/// @description Setting the size

image_xscale = ui_width / (sprite_width - 18)
image_yscale = ui_height / (sprite_height - 24)
x = round(ui_parent.x + ui_x - ui_width * ui_anchor[0]) - 18
y = round(ui_parent.y + ui_y - ui_height * ui_anchor[1]) - 12
