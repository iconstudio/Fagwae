/// @description Declare the main menu
event_inherited()

Main = DepthMenuGroup("interface")
Main.x = SCREEN_W * 0.5
Main.y = SCREEN_H * 0.333

Main_Start = DepthMenuText("Start").attach(Main)
Main_Trop = DepthMenuText("Trophy").attach(Main)
Main_Book = DepthMenuText("Journal").attach(Main)
Main_Option = DepthMenuText("Setting").attach(Main)
Main_Exit = DepthMenuText("Exit").attach(Main)


// Start
ProfileSelector = DepthMenuGroup("interface")

ProfileSelector.join(DepthMenuText("Profile 1"))
ProfileSelector.join(DepthMenuText("Profile 2"))
ProfileSelector.join(DepthMenuText("Back"))


// Trophy
TrophyViewer = DepthMenuGroup("interface")

TrophyViewer.join(DepthMenuText("Achievement 1"))
TrophyViewer.join(DepthMenuText("Achievement 2"))
TrophyViewer.join(DepthMenuText("Achievement 3"))
TrophyViewer.join(DepthMenuText("Achievement 4"))
TrophyViewer.join(DepthMenuText("Back"))


// Journal
JournalViewer = DepthMenuGroup("interface")

JournalViewer.join(DepthMenuText("Playlog"))
JournalViewer.join(DepthMenuText("Back"))


// Exit
ExitQuery = DepthMenuGroup("interface")

ExitQuery.join(DepthMenuText("Yes"))
ExitQuery.join(DepthMenuText("No"))


render_target = Main


draw_set_font(fontMainMenuEntry)
