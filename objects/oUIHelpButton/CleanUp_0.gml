if instance_exists(oUIButtonPane) {
	with oUIButtonPane {
		if content_number > 0 {
			for (var i = 0; i < content_number; ++i)
				instance_destroy(contents[i])
		}
	}
}
