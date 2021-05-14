/// @function PN_1D_smoothedNoise(x, seed, wavelength, scale)
function PN_1D_smoothedNoise(position, seed, wavelength, scale) {
	var factor = (position / wavelength) * scale
	return PN_1D_noise(factor, seed) * 0.5 + PN_1D_noise(factor - 1, seed) * 0.25 + PN_1D_noise(factor + 1, seed) * 0.25
}
