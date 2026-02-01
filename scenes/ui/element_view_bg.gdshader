shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
	
}
uniform sampler2D NOISE_PATTERN;

uniform float scroll_speed = 0.01; // Speed of scrolling
uniform float intensity = 0.1; // Speed of scrolling

void fragment() {
	vec2 uv = mod(vec2(UV.x, UV.y) / 3.0, 1.0);
	
	float scrolled_v = mod(TIME * scroll_speed, 1.0);
	
	float noiseValue = texture(NOISE_PATTERN, 
		vec2(
			mod(uv.x + scrolled_v, 1.0), 
			mod(uv.y + scrolled_v, 1.0)
		)).r * 2.0 - 1.0;
	
	COLOR = texture(TEXTURE, UV) + vec4(vec3(noiseValue), 1.0) * intensity;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
