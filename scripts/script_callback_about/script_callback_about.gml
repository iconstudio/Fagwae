var ui_hierachy = ui_parent

contents[content_number] = ui_create(0, 0, oUILabel, "ZUI_Above")
with contents[content_number++] {
	x = round(ui_hierachy.x + ui_hierachy.ui_width * 0.5)
	y = round(ui_hierachy.y + ui_hierachy.ui_height * 0.5)
	//valign = 0
	ui_label_set_caption("Fagwae 2\n" + GM_version + "© 2018 Iconer\n" + date_time_string(GM_build_date))
	closable = true
	animate = 0
}
/*
contents[content_number] = ui_create(0, 0, oUILabel, "ZUI_Above")
with contents[content_number++] {
	x = round(ui_hierachy.x + 40)
	y = round(ui_hierachy.y + 430)
	halign = 0
	valign = 0
	ui_label_set_caption("버전" + GM_version + "\n마지막 빌드 날짜: " + date_time_string(GM_build_date))
	closable = true
	animate = 0
}
*/
contents[content_number] = ui_create(0, 0, oUIButton, "ZUI_Above")
with contents[content_number++] {
	ui_set_size(120, 60)
	x = round(ui_hierachy.x + 40)
	y = round(ui_hierachy.y + 500)
	event_user(0)
	caption = "Github"
	callback = script_callback_open_blog
}
