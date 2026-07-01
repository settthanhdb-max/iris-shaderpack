// composite.fsh — perform bloom prefilter and basic composite

varying vec2 v_uv;
uniform sampler2D uScene;

// simple bright-pass
void main() {
    vec3 col = texture2D(uScene, v_uv).rgb;
    float lum = dot(col, vec3(0.2126, 0.7152, 0.0722));
    vec3 bright = col * max(lum - 0.75, 0.0) * 4.0;
    gl_FragColor = vec4(bright, 1.0);
}
