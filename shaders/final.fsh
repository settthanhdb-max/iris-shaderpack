// final.fsh — combine scene + bloom + basic tone mapping + gamma

#include "common.glsl"

varying vec2 v_uv;

uniform sampler2D uScene;
uniform sampler2D uBloom;

void main() {
    vec3 scene = texture2D(uScene, v_uv).rgb;
    vec3 bloom = texture2D(uBloom, v_uv).rgb;
    vec3 color = scene + bloom * 0.6;
    color = toneMapACES(color);
    color = linearToSRGB(color);
    gl_FragColor = vec4(color, 1.0);
}
