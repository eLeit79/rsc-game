//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
		gl_FragColor = vec4(gl_FragColor.rg * 2.5, gl_FragColor.b * 1.0, gl_FragColor.a);
}
