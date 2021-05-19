/// @description Declare the main menu
event_inherited()


Main = DepthMenuGroup("interface")
Main.x = SCREEN_W * 0.5
Main.y = SCREEN_H * 0.333
Main.set_fade_duration(0.4)
Main.fade_time = 0.4
Main.mode = MENU_STATUSES.NORMAL


// Start Menu
Main_Start = DepthMenuText("Start").attach(Main)
Main_Start.set_predicate(function() {
	change_render_target(ProfileSelector)
})


// Profiles
ProfileSelector = DepthMenuGroup("interface")
ProfileSelector.set_fade_duration(0.4)

ProfileSelector.join(DepthMenuText("Profile 1"))
ProfileSelector.join(DepthMenuText("Profile 2"))
ProfileSelector.join(DepthMenuText("Back"))


// Settings Menu
Main_Option = DepthMenuText("Setting").attach(Main)
Main_Option.set_predicate(function() {
	change_render_target(SettingPanel)
})


SettingPanel = DepthMenuGroup("interface")
SettingPanel.set_fade_duration(0.4)


// Trophy Menu
Main_Trop = DepthMenuText("Trophy").attach(Main)
Main_Trop.set_predicate(function() {
	change_render_target(TrophyViewer)
})


TrophyViewer = DepthMenuGroup("interface")
TrophyViewer.set_fade_duration(0.4)

TrophyViewer.join(DepthMenuText("Achievement 1"))
TrophyViewer.join(DepthMenuText("Back"))


// Journal Menu
Main_Book = DepthMenuText("Journal").attach(Main)
Main_Book.set_predicate(function() {
	change_render_target(JournalViewer)
})


JournalViewer = DepthMenuGroup("interface")
JournalViewer.set_fade_duration(0.4)

JournalViewer.join(DepthMenuText("Playlog"))
JournalViewer.join(DepthMenuText("Back"))


// Exit Menu
Main_Exit = DepthMenuText("Exit").attach(Main)
Main_Exit.set_predicate(function() {
	change_render_target(ExitQuery)

	ExitQuery.select(1)
})


ExitQuery = DepthMenuGroup("interface")
ExitQuery.set_fade_duration(0.4)

ExitQuery.join(DepthMenuText("Yes"))
ExitQuery.join(DepthMenuText("No"))


change_render_target(Main)


draw_set_font(fontMainMenuEntry)
