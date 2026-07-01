// common.glsl — shared utilities for the shaders

// Simple gamma correction helpers
float linearToSRGB(float x) {
    return (x <= 0.0031308) ? 12.92 * x : 1.055 * pow(x, 1.0/2.4) - 0.055;
}

vec3 linearToSRGB(vec3 c) {
    return vec3(linearToSRGB(c.r), linearToSRGB(c.g), linearToSRGB(c.b));
}

// Simple tone mapping (ACES-like approximation)
vec3 toneMapACES(vec3 x) {
    // a tiny, stable approximation
    x = max(vec3(0.0), x);
    return (x * (2.51 * x + 0.03)) / (x * (2.43 * x + 0.59) + 0.14);
}
