/// @function PN_1D_noise(x, seed)
function PN_1D_noise(position, seed) {
	var PrevSeed = random_get_seed()
	random_set_seed(floor(position) + seed)

	var Result = random_range(-1,1)
	random_set_seed(PrevSeed)
	return Result
}
