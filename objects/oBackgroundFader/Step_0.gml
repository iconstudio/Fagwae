size += 3
if size > room_height {
	with oStageParent
		layer_background_blend(background_id, other.image_blend)
	instance_destroy()
}
