precision mediump float;

varying vec2 texCoord;

uniform sampler2D tex1;
uniform sampler2D tex2;

vec4 lut(vec4 base, sampler2D tex) {
    return vec4(texture2D(tex, vec2(base.r, 0.0)).r, texture2D(tex, vec2(base.g, 0.0)).g, texture2D(tex, vec2(base.b, 0.0)).b, base.a);
}

void main() {
    gl_FragColor = lut(texture2D(tex1, texCoord), tex2);
}