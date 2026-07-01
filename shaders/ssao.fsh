// ssao.fsh — very small-screen-space ambient occlusion approximation

varying vec2 v_uv;
uniform sampler2D uDepth;

float unpackDepth(vec4 d) {
    // assuming depth in alpha like the gbuffer above
    return d.a;
}

void main() {
    float d = unpackDepth(texture2D(uDepth, v_uv));
    float ao = 0.0;
    float radius = 0.02;
    for(int i=0;i<6;i++){
        float ang = float(i) * 1.04719755; // ~60 degrees
        vec2 off = vec2(cos(ang), sin(ang)) * radius;
        float sample = unpackDepth(texture2D(uDepth, v_uv + off));
        ao += step(sample, d) * 0.2; // crude
    }
    ao = clamp(1.0 - ao*0.3, 0.0, 1.0);
    gl_FragColor = vec4(vec3(ao),1.0);
}
