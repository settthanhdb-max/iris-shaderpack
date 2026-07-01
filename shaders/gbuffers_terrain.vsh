// gbuffers_terrain.vsh
// Minimal vertex shader for terrain gbuffer

attribute vec3 position;
attribute vec2 texcoord;
attribute vec4 color;

uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;

varying vec2 v_texcoord;
varying vec4 v_color;

void main() {
    v_texcoord = texcoord;
    v_color = color;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
