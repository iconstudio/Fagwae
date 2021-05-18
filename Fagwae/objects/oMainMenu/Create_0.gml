/// @description Declare the main menu
TopMainMenu = DepthMenuGroup("interface")

with TopMainMenu {
	
}


TopMainMenu.join(DepthMenuText("Start"))
TopMainMenu.join(DepthMenuText("Trophy"))
TopMainMenu.join(DepthMenuText("Journal"))
TopMainMenu.join(DepthMenuText("Setting"))
TopMainMenu.join(DepthMenuText("Exit"))


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


FagwaeMainDepth = TopMainMenu
