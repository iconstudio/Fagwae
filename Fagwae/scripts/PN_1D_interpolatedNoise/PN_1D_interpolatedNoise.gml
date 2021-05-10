/// @function PN_1D_interpolatedNoise(x, seed, wavelength, scale)
function PN_1D_interpolatedNoise(position, seed, wavelength, scale) {
	var factor = (position / wavelength) * scale
	var integer_f = floor(factor)
	var fractional_f = frac(factor)

	var v1 = PN_1D_smoothedNoise(integer_f, seed, 1, 1)
	var v2 = PN_1D_smoothedNoise(integer_f + 1, seed, 1, 1)

	return lerp(v1, v2, fractional_X)
}
