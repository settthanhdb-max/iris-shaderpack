// godrays.fsh — cheap screen-space godray (radial blur from light position)

varying vec2 v_uv;
uniform sampler2D uScene;
uniform vec2 uLightScreenPos; // in [0,1]

void main() {
    vec2 dir = v_uv - uLightScreenPos;
    vec3 col = vec3(0.0);
    float decay = 0.95;
    float exposure = 0.6;
    float density = 0.8;
    vec2 uv = v_uv;
    float weight = 1.0;
    for(int i=0;i<20;i++){
        uv -= dir * (density / 20.0);
        vec3 samp = texture2D(uScene, uv).rgb;
        col += samp * weight;
        weight *= decay;
    }
    col *= exposure;
    gl_FragColor = vec4(col, 1.0);
}
