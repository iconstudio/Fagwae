//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float intensity;
uniform sampler2D pscreen;


void main()
{
	vec4 color = texture2D(pscreen, v_vTexcoord);

	float incrr = (0.5 - color.r) * 0.46013 * intensity;
	float incrg = (0.5 - color.g) * 0.71559 * intensity;
	float incrb = (0.5 - color.b) * 0.68 * intensity;
	float incra = (1.0 - color.a) * 0.2 * intensity;

	vec4 increment = vec4(incrr, incrg, incrb, incra);
	color += (increment);

	gl_FragColor = v_vColour * color;
}
