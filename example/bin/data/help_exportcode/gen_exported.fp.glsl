#define hypot(x, y) sqrt(x*x+y*y)
#define xor(x, y)	((!(x&&y))&&(x||y))
#define sinh(x)		(0.5*(exp(x) - exp(-x)))
#define cosh(x)		(0.5*(exp(x) + exp(-x)))
#define tanh(x)		((sinh(x))/(cosh(x)))
#define asinh(x)	(log(x) + sqrt(x*x+1.))
#define acosh(x)	(log(x) + sqrt(x*x-1.))
#define atanh(x)	(0.5*log((1.+x)/(1.-x)))

vec2 jit_wrap1(vec2 v) {
	return mod(v, 1.);
}

vec2 jit_clamp1(vec2 v) {
	return clamp(v, 0., 1.);
}

vec2 jit_mirror1(vec2 v) {
	return 1.-abs((mod(v, 2.)-1.));
}


uniform float amp;
uniform samplerJit0 tin1;

varying vec2 texcoord1;
varying vec2 flip1;
varying vec2 flip1_offset;
varying vec2 texdim1;
varying vec2 texcoord;







vec4 sample_mirror_unit0(samplerJit0 tex, vec2 tc);
vec4 sample_mirror_unit0(samplerJit0 tex, vec2 tc) {
	return textureJit0(tex, jit_mirror1(tc*flip1)*texdim1);
}



void main() {
	vec4 in1 = textureJit0(tin1, texcoord1);
	vec2 norm = texcoord;
	
	
	
	vec2 mul_21 = (amp * norm);
	vec2 cos_20 = ((cos(mul_21)));
	vec4 sample_22 = ((sample_mirror_unit0(tin1, cos_20)));
	gl_FragData[0] = sample_22;
}
