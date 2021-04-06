Menu()

with add_text("Start") {
	add_text("Shape Area").off_open()
	add_text("Frame Area").off_open()
	add_text("Disorted Area").off_open()
	add_text("Bossfight").off_open()

	focus()
}

with add_text("Debug") {
	with add_text("Invincible") {
		add_text("On")
		add_text("Off")

		focus()
	}
	
	with add_text("Overpower") {
		add_text("On")
		add_text("Off")
	}

	with add_text("Infinite bombs") {
		add_text("On")
		add_text("Off")
	}

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
