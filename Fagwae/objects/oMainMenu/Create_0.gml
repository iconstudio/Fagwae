/// @description Declare the main menu
event_inherited()

Main = DepthMenuGroup("interface")
Main.x = SCREEN_W * 0.5
Main.y = SCREEN_H * 0.333


// Start
Main_Start = DepthMenuText("Start").attach(Main)
Main_Start.set_predicate(function() {
	change_render_target(ProfileSelector)
})


ProfileSelector = DepthMenuGroup("interface")

ProfileSelector.join(DepthMenuText("Profile 1"))
ProfileSelector.join(DepthMenuText("Profile 2"))
ProfileSelector.join(DepthMenuText("Back"))


// Setting
Main_Option = DepthMenuText("Setting").attach(Main)
Main_Option.set_predicate(function() {
	change_render_target(SettingPanel)
})


SettingPanel = DepthMenuGroup("interface")


// Trophy
Main_Trop = DepthMenuText("Trophy").attach(Main)
Main_Trop.set_predicate(function() {
	change_render_target(TrophyViewer)
})


TrophyViewer = DepthMenuGroup("interface")

TrophyViewer.join(DepthMenuText("Achievement 1"))
TrophyViewer.join(DepthMenuText("Back"))


// Journal
Main_Book = DepthMenuText("Journal").attach(Main)
Main_Book.set_predicate(function() {
	change_render_target(JournalViewer)
})


JournalViewer = DepthMenuGroup("interface")

JournalViewer.join(DepthMenuText("Playlog"))
JournalViewer.join(DepthMenuText("Back"))


// Exit
Main_Exit = DepthMenuText("Exit").attach(Main)
Main_Exit.set_predicate(function() {
	change_render_target(ExitQuery)

	ExitQuery.select(1)
})


ExitQuery = DepthMenuGroup("interface")

ExitQuery.join(DepthMenuText("Yes"))
ExitQuery.join(DepthMenuText("No"))


change_render_target(Main)


draw_set_font(fontMainMenuEntry)
