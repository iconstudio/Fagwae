/// @description Destroying all contents

if content_number > 0 {
	for (var i = 0; i < content_number; ++i) {
		with contents[i] {
			if closable
				close = true
			else
				instance_destroy()
		}
	}
	content_number = 0
}
