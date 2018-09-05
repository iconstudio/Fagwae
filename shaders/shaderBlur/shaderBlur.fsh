varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 blurCoord[4];

void main()
{
    vec4 sum = vec4(0.0, 0.0, 0.0, 0.0);    

    sum += texture2D(gm_BaseTexture, v_vTexcoord) * 0.220458;
    sum += texture2D(gm_BaseTexture, v_vTexcoord + blurCoord[0]) * 0.189986;
    sum += texture2D(gm_BaseTexture, v_vTexcoord - blurCoord[0]) * 0.189986;
    sum += texture2D(gm_BaseTexture, v_vTexcoord + blurCoord[1]) * 0.121592;
    sum += texture2D(gm_BaseTexture, v_vTexcoord - blurCoord[1]) * 0.121592;
    sum += texture2D(gm_BaseTexture, v_vTexcoord + blurCoord[2]) * 0.057793;
    sum += texture2D(gm_BaseTexture, v_vTexcoord - blurCoord[2]) * 0.057793;
    sum += texture2D(gm_BaseTexture, v_vTexcoord + blurCoord[3]) * 0.020400;
    sum += texture2D(gm_BaseTexture, v_vTexcoord - blurCoord[3]) * 0.020400;

    gl_FragColor = sum * v_vColour;
}