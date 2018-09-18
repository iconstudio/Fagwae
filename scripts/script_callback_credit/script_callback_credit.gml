var ui_hierachy = ui_parent
contents[content_number] = ui_create(0, 0, oUILabel, "ZUI_Above")
with contents[content_number++] {
	x = round(ui_hierachy.x + 20)
	y = round(ui_hierachy.y + ui_hierachy.ui_height * 0.5)
	ui_label_set_caption("Copyright 2018 Iconer\n")
	halign = 0
	closable = true
	animate = 0
}
