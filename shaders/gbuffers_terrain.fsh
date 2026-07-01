// gbuffers_terrain.fsh
// Minimal fragment shader writing out position-normal-color to g-buffers

varying vec2 v_texcoord;
varying vec4 v_color;

uniform sampler2D texture0;

void main() {
    vec4 albedo = texture2D(texture0, v_texcoord) * v_color;
    // normals and position buffers are approximated: write normal-ish and depth into alpha
    // For simplicity we store albedo in RGB and a simple depth approximation in A
    float depth = gl_FragCoord.z; // not linear; acceptable for this lightweight pack
    gl_FragColor = vec4(albedo.rgb, depth);
}
