var ui_hierachy = ui_parent
contents[content_number] = ui_create(0, 0, oUILabel, "ZUI_Above")
with contents[content_number++] {
	x = round(ui_hierachy.x + ui_hierachy.ui_width * 0.5)
	y = round(ui_hierachy.y + ui_hierachy.ui_height * 0.5)
	ui_label_set_caption("Fagwae 2\ncopyright 2018 Iconer\nfrom")
	closable = true
	animate = 0
}

contents[content_number] = ui_create(0, 0, oUIButton, "ZUI_Above")
with contents[content_number++] {
	ui_set_size(120, 60)
	x = round(ui_hierachy.x + ui_hierachy.ui_width * 0.5 - 60)
	y = round(ui_hierachy.y + ui_hierachy.ui_height * 0.5 - 30)
	event_user(0)
	caption = "iconer.playgm.co.kr"
	callback = -1
}
