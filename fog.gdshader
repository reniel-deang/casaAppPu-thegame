shader_type canvas_item;

uniform sampler2D noise_texture: repeat_enable, filter_nearest;

//Fog density
uniform float density: hint_range(0.0, 1.0) = 1;

//Fog Speed
uniform vec2 speed = vec2(0.005, 0.025);
void fragment() {
	//Make the fog slowly move
	vec2 uv = UV + speed * TIME;


	// Called for every pixel the material is visible on.
	//Sample the noise texture
	float noise = texture(noise_texture, uv).r;

	//Covert the noise value from the (0.0, 1.0) range to the (-1.0, 1.0) range
	// and clamp it between 0.0 and 1.0  again
	float fog = clamp(noise * 2.0 - 1.0, 0.0, 1.0);

	//Apply the fog effect
	COLOR.a *= fog * density;
}
