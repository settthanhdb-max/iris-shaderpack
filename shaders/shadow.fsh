// shadow.fsh — minimal shadow fragment shader

void main() {
    // depth-only shadow map; write depth into color
    // Modern pipelines store depth automatically; for compatibility write white
    gl_FragColor = vec4(1.0);
}
