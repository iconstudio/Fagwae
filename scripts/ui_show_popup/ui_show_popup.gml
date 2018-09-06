/// @description ui_show_popup(caption)
/// @param caption
with oGlobal {
 var _black = ui_create(0, 0, oUIBlack, "ZUI_Below")

 with ui_create(ui_width * 0.5, ui_height * 0.5, oUIWindow, "ZUI") {
  ui_width = 256
	ui_height = 112
  black = _black
  
  with ui_create(0, 0, oUIWindowCaption, "ZUI_Above") {
   caption = "Popup"
  }
  
  with ui_create(ui_get_width() * 0.5, ui_get_height() * 0.5 - 8, oUILabel, "ZUI_Above") {
   caption = argument0
  }
  
  with ui_create(ui_get_width() * 0.5, ui_get_height() - 24, oUIButton, "ZUI_Above") {
   ui_set_size(96, 28)
   caption = "OK"
   callback = ui_popup_close
  }
 }
}