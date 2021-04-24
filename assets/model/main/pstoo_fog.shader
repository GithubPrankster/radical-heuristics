shader_type spatial;
render_mode diffuse_lambert_wrap, unshaded, ambient_light_disabled, cull_disabled;

uniform vec4 mixer : hint_color = vec4(1.0);
uniform sampler2D tex : hint_albedo;

varying float fog_weight;
varying float vertex_distance;

const float min_fog_distance = 10.0;
const float max_fog_distance = 20.0;

uniform bool fog = true;
uniform vec3 fog_color = vec3(0.32, 0.38, 0.42);

float inv_lerp(float from, float to, float value)
{
	return (value - from) / (to - from);
}

void vertex(){
	vertex_distance = length((MODELVIEW_MATRIX * vec4(VERTEX, 1.0)));

	fog_weight = inv_lerp(min_fog_distance, max_fog_distance, vertex_distance);
	COLOR.a = clamp(fog_weight, 0, 1);
}

void fragment(){
	ALBEDO = (texture(tex, UV) * mixer).rgb;
	ALBEDO *= COLOR.rgb;
	if(fog)
		ALBEDO = mix(ALBEDO, fog_color, COLOR.a);
}