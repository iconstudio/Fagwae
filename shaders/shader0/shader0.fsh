//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float worley(vec2 p) {
 float d = 1e30;
 for (int xo = -1; xo <= 1; ++xo) {
  for (int yo = -1; yo <= 1; ++yo) {
   vec2 tp = floor(p) + vec2(xo, yo);
   d = min(d, length2(p - tp - noise(tp)));
  }
 }
  return 3.0 * exp(-4.0*abs((2.5*d)-1.0));
}

float fworley(vec2 p)
{
    return sqrt(sqrt(sqrt(worley(p * 5.0 + 0.15 * iTime) * sqrt(worley(p*50.0+ 0.18+ -0.1*iTime)) * sqrt(sqrt(worley(p*-10.0+0.3*iTime))))));
}


void main() {
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	v_vTexcoord *= 0.3;
	
	vec2 uv = fragCoord.xy / iResolution.xy;
	float wolo = fworley(uv * iResolution.xy / 1500.0);
 	wolo *= exp(-length2(abs(0.7 * uv - 1.0)));
	gl_FragColor = vec4(wolo * vec3(1.0, 0.1 * wolo, pow(wolo, 0.90 - wolo)), 1.0);

	vec3 hsv = rgb2hsv(gl_FragColor.xyz);
	hsv.z *= hsv.z * 16.0;
	hsv.x = 0.6;
	gl_FragColor.xyz = hsv2rgb(hsv);
}