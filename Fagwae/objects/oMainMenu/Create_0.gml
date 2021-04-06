Menu()

with add_text("Start") {
	add_text("Shape Area")
	add_text("Frame Area")
	add_text("Disorted Area")
	add_text("Bossfight")

	focus()
}

with add_text("Debug") {
	with add_text("Invincible") {
		focus()
	}
	
	add_text("Overpower")
	add_text("Infinite bombs")
	add_text("Back")
}

with add_text("Setting") {
	add_text("Back")
}

with add_text("Exit") {
	add_text("Yes")
	with add_text("No") {
		focus()
	}

	set_callback(function() {
		focus_index(1)
	})
}

set_open(true)

global.main_depth_stack = new Stack()
global.main_depth = id
