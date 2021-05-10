/// @function PN_1D_smoothedNoise(x, seed, wavelength, scale)
function PN_1D_smoothedNoise(position, argument1, argument2, argument3) {
	var factor = (position / argument2) * argument3
	return PN_1D_noise(factor, argument1) * 0.5 + PN_1D_noise(factor - 1, argument1) * 0.25 + PN_1D_noise(factor + 1, argument1) * 0.25
}
