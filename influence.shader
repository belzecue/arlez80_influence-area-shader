/*
	勢力圏表示 シェーダー for Godot Engine by あるる（きのもと 結衣） @arlez80
	Influence area displaying shader by Yui Kinomoto

	（多分）GLSL2対応

	MIT License
*/
shader_type spatial;
render_mode unshaded;

const float max_float = 1000000.0;

uniform vec4 team_a_color : hint_color = vec4( 1.0, 0.0, 0.0, 1.0 );
uniform vec4 team_b_color : hint_color = vec4( 0.0, 0.0, 1.0, 1.0 );
uniform float range = 28.0;
uniform float outline_size = 0.1;

// Sampler2Dでもいいけど、とりあえず32個指定式にした
// もしかしたらGLSL2で使うかもしれないからtexelFetchなど使えないため
// あと、vec4はColorで座標を渡す時に問題があるのでやめた
uniform vec3 influence_vertex0 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color0 = 0.0;
uniform vec3 influence_vertex1 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color1 = 0.0;
uniform vec3 influence_vertex2 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color2 = 0.0;
uniform vec3 influence_vertex3 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color3 = 0.0;
uniform vec3 influence_vertex4 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color4 = 0.0;
uniform vec3 influence_vertex5 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color5 = 0.0;
uniform vec3 influence_vertex6 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color6 = 0.0;
uniform vec3 influence_vertex7 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color7 = 0.0;
uniform vec3 influence_vertex8 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color8 = 0.0;
uniform vec3 influence_vertex9 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color9 = 0.0;
uniform vec3 influence_vertex10 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color10 = 0.0;
uniform vec3 influence_vertex11 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color11 = 0.0;
uniform vec3 influence_vertex12 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color12 = 0.0;
uniform vec3 influence_vertex13 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color13 = 0.0;
uniform vec3 influence_vertex14 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color14 = 0.0;
uniform vec3 influence_vertex15 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color15 = 0.0;
uniform vec3 influence_vertex16 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color16 = 0.0;
uniform vec3 influence_vertex17 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color17 = 0.0;
uniform vec3 influence_vertex18 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color18 = 0.0;
uniform vec3 influence_vertex19 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color19 = 0.0;
uniform vec3 influence_vertex20 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color20 = 0.0;
uniform vec3 influence_vertex21 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color21 = 0.0;
uniform vec3 influence_vertex22 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color22 = 0.0;
uniform vec3 influence_vertex23 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color23 = 0.0;
uniform vec3 influence_vertex24 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color24 = 0.0;
uniform vec3 influence_vertex25 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color25 = 0.0;
uniform vec3 influence_vertex26 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color26 = 0.0;
uniform vec3 influence_vertex27 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color27 = 0.0;
uniform vec3 influence_vertex28 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color28 = 0.0;
uniform vec3 influence_vertex29 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color29 = 0.0;
uniform vec3 influence_vertex30 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color30 = 0.0;
uniform vec3 influence_vertex31 = vec3( 0.0, 0.0, 0.0 );
uniform float influence_color31 = 0.0;

void calc_min_dist( in vec3 rp, in float c, in vec3 v, inout float team_a_min_dist, inout float team_b_min_dist )
{
	float t = distance( rp, v );
	team_a_min_dist = min( team_a_min_dist, mix( t, max_float, c ) );
	team_b_min_dist = min( team_b_min_dist, mix( max_float, t, c ) );
}

void fragment( )
{
	vec3 v = ( CAMERA_MATRIX * vec4( VERTEX, 1.0 ) ).xyz;
	float team_a_min_dist = max_float;
	float team_b_min_dist = max_float;

	calc_min_dist( influence_vertex0, influence_color0, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex1, influence_color1, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex2, influence_color2, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex3, influence_color3, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex4, influence_color4, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex5, influence_color5, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex6, influence_color6, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex7, influence_color7, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex8, influence_color8, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex9, influence_color9, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex10, influence_color10, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex11, influence_color11, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex12, influence_color12, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex13, influence_color13, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex14, influence_color14, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex15, influence_color15, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex16, influence_color16, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex17, influence_color17, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex18, influence_color18, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex19, influence_color19, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex20, influence_color20, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex21, influence_color21, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex22, influence_color22, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex23, influence_color23, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex24, influence_color24, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex25, influence_color25, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex26, influence_color26, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex27, influence_color27, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex28, influence_color28, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex29, influence_color29, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex30, influence_color30, v, team_a_min_dist, team_b_min_dist );
	calc_min_dist( influence_vertex31, influence_color31, v, team_a_min_dist, team_b_min_dist );

	vec4 color = (
		mix( vec4( 0.0, 0.0, 0.0, 0.0 ), team_a_color, float( abs( team_a_min_dist - range ) < outline_size ) )
	+	mix( vec4( 0.0, 0.0, 0.0, 0.0 ), team_b_color, float( abs( team_b_min_dist - range ) < outline_size ) )
	);

	ALBEDO = color.rgb;
	if( clamp( color.a, 0.0, 1.0 ) <= 0.00001 ) {
		discard;
	}
}
