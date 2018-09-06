/// @description Setting the size

image_xscale = ui_width / (sprite_width - 32)
image_yscale = ui_height / (sprite_height - 32)
x = round(ui_parent.x + ui_x - ui_width * ui_anchor[0])
y = round(ui_parent.y + ui_y - ui_height * ui_anchor[1])
