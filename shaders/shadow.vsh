// shadow.vsh — simple pass-through for shadow map rendering

attribute vec3 position;

uniform mat4 lightProjectionMatrix;
uniform mat4 modelViewMatrix;

void main() {
    gl_Position = lightProjectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
