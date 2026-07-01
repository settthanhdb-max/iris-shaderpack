// bloom.fsh — small separable blur (horizontal pass). Combine passes externally.

varying vec2 v_uv;
uniform sampler2D uTexture;
uniform vec2 uDirection; // (1.0/width, 0) or (0, 1.0/height)

void main() {
    vec3 sum = vec3(0.0);
    sum += texture2D(uTexture, v_uv - 4.0*uDirection).rgb * 0.05;
    sum += texture2D(uTexture, v_uv - 3.0*uDirection).rgb * 0.09;
    sum += texture2D(uTexture, v_uv - 2.0*uDirection).rgb * 0.12;
    sum += texture2D(uTexture, v_uv - 1.0*uDirection).rgb * 0.15;
    sum += texture2D(uTexture, v_uv).rgb * 0.16;
    sum += texture2D(uTexture, v_uv + 1.0*uDirection).rgb * 0.15;
    sum += texture2D(uTexture, v_uv + 2.0*uDirection).rgb * 0.12;
    sum += texture2D(uTexture, v_uv + 3.0*uDirection).rgb * 0.09;
    sum += texture2D(uTexture, v_uv + 4.0*uDirection).rgb * 0.05;
    gl_FragColor = vec4(sum, 1.0);
}
