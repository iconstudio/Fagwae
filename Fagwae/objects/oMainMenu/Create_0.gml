Menu()

with add_text("Start") {
	
}

with add_text("Debug") {
	
}

with add_text("Setting") {
	
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
