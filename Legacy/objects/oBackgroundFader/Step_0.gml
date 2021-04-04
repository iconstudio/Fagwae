if size_time++ > size_period {
	with oStageParent
		layer_background_blend(background_id, other.image_blend)
	instance_destroy()
}
