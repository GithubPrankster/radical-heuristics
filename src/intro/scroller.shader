shader_type canvas_item;

uniform vec4 mixer : hint_color = vec4(1.0);
uniform float time = 0.0;

void fragment()
{
	COLOR.rgb = mixer.rgb;
	COLOR.a = (sin((UV.x* 14.0) + (time * 2.5)) * 0.5) + 0.5;
	COLOR.a = COLOR.a > 0.3 ? COLOR.a : 1.0 - smoothstep(0.1, 0.3, COLOR.a);
	COLOR.a *= smoothstep(0.0, 0.1, UV.y);
	COLOR.a *= 1.0 - smoothstep(0.9, 1.0, UV.y);
	COLOR.a *= mixer.a;
}