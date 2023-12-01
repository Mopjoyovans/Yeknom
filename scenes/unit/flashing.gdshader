shader_type canvas_item;
uniform float toggled;

void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
    //COLOR = texture(TEXTURE, UV);
	//float toggled = 0.0;
	float time_mod = 1.0;
    //COLOR.a = mix(COLOR.a, abs(sin(TIME * 0.5)), 1);
	if(toggled > 0.0) {
		COLOR = vec4(
			mix(input_color.r, abs(sin(TIME * time_mod)), toggled),
			mix(input_color.g, abs(sin(TIME * time_mod)), toggled),
			mix(input_color.r, abs(sin(TIME * time_mod)), toggled),
			input_color.a
		);
	} else {
		COLOR = vec4(input_color.r, input_color.g, input_color.b, input_color.a);
	}
	//COLOR = vec4(input_color.r, input_color.g, input_color.b, input_color.a);
	//COLOR = vec4(input_color.r, input_color.g, input_color.b, mix(input_color.a, abs(sin(TIME * 1.5)), 1));
	//COLOR += vec4(sin(TIME * 0.5) * 100.0, 0);
	//COLOR = vec4(input_color.r, input_color.g, input_color.b, sin(TIME * input_color.a) * 100.0);
	//sin(TIME * 0.5) * 100.0
}
