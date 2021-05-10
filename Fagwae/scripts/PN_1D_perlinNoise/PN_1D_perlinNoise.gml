/// @function PN_1D_perlinNoise(x, seed, persistence, octaves, wavelength, scale)
function PN_1D_perlinNoise(position, seed, persistence, octaves, wavelength, scale) {
	var total = 0
	var Number_Of_Octaves = octaves - 1
	var factor = (position / wavelength) * scale

	var i, frequency, amplitude
	for (var i = 0; i <= Number_Of_Octaves; i++) {
		frequency = power(2, i)
		amplitude = power(persistence, i)

		total += PN_1D_interpolatedNoise(factor * frequency, seed, 1, 1) * amplitude
	}

	return total
}
