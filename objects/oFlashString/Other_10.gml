/// @description 

with object_index {
	if id != other.id {
		if type_create == other.type_create or (other.type_create == 3 && type_create == 2)
			dmode = 2
	}
}

if type_create == 0 or type_create == 3 {
	rscale = 3
} else {
	rscale = 2
	depth += 1
}

draw_set_font(global.font)
sw = string_width(ncaption) * (rscale)
if x < sw
	x = sw
if x > screen_width - sw
	x = screen_width - sw