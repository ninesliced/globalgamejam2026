shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
	
}
uniform sampler2D NOISE_PATTERN;

uniform float scroll_speed = 0.05; // Speed of scrolling
uniform float deform_intesity = 0.03; // Speed of scrolling

void fragment() {
	vec2 uv = UV;
	
	float scrolled_v = mod(TIME * scroll_speed, 1.0);
	
	float noiseValue = texture(NOISE_PATTERN, 
		vec2(
			mod(UV.x + scrolled_v, 1.0), 
			mod(UV.y + scrolled_v, 1.0)
		)).r * 2.0 - 1.0;
	
	COLOR = texture(TEXTURE, vec2(uv.x + noiseValue*deform_intesity, uv.y));
	//COLOR = vec4(noiseValue, noiseValue, noiseValue, 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
