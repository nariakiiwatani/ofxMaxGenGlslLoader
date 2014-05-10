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


uniform float hue_shift;
uniform samplerJit0 tin1;

varying vec2 texcoord1;
varying vec2 flip1;
varying vec2 flip1_offset;
varying vec2 texdim1;








vec3 rgb2hsl_vec3(vec3 vrgb);
vec4 rgb2hsl_vec4(vec4 vrgb);
float rgbhue(float v1, float v2, float h);
vec3 hsl2rgb_vec3(vec3 hsl);
vec4 hsl2rgb_vec4(vec4 hsl);
vec3 rgb2hsl_vec3(vec3 vrgb) {
	vec3 hsl;

	float vmin = min(min(vrgb.x, vrgb.y), vrgb.z);
	float vmax = max(max(vrgb.x, vrgb.y), vrgb.z);
	float delta = vmax-vmin;
	float deltasum = vmax+vmin;
	
	hsl.z = deltasum*0.5;

	if(delta == 0.) {
		// grey
		hsl.x = 0.;
		hsl.y = 0.;
	}
	else {
		if(hsl.z < 0.5 ) {
			hsl.y = delta/deltasum;
		}
		else {
			hsl.y = delta/(2.-vmax-vmin);
		}

		vec3 drgb = ((vmax-vrgb)*0.16666666666667 + 0.5*delta)/delta;
		
		if(vrgb.x == vmax) {
			hsl.x = drgb.z-drgb.y;
		}
		else if(vrgb.y == vmax) {
			hsl.x = 0.3333333333333 + drgb.x - drgb.z;
		}
		else {
			hsl.x = 0.6666666666667 + drgb.y - drgb.x;
		}
		
		
		if(hsl.x < 0.) {
			hsl.x += 1.;
		}
		else if(hsl.x > 1.) {
			hsl.x -= 1.;
		}
	}

	return hsl;
}
vec4 rgb2hsl_vec4(vec4 vrgb) {
	vec4 hsla;
	hsla.rgb = rgb2hsl_vec3(vrgb.rgb);
	hsla.a = vrgb.a;
	return hsla;
}
float rgbhue(float v1, float v2, float h) {
	if(h < 0.) {
		h += 1.;
	}
	else if(h > 1.) {
		h -= 1.;
	}
	if((6.*h) < 1.) {
		return v1+(v2-v1)*6.*h;
	}
	else if((2.*h) < 1.) {
		return v2;
	}
	else if((3.*h) < 2.) {
		return v1+(v2-v1)*(0.6666666666667-h)*6.;
	}
	return v1;
}
vec3 hsl2rgb_vec3(vec3 hsl) {
	vec3 vrgb;
	if(hsl.y == 0.) {
		vrgb.x = hsl.z;
		vrgb.y = hsl.z;
		vrgb.z = hsl.z;
	}
	else {
		float v2;
		if(hsl.z < 0.5 ) {
			v2 = hsl.z*(1.+hsl.y);
		}
		else {
			v2 = (hsl.z+hsl.y) - (hsl.y*hsl.z);
		}

		float v1 = 2.*hsl.z-v2;

		vrgb.x = rgbhue(v1, v2, hsl.x+0.3333333333333);
		vrgb.y = rgbhue(v1, v2, hsl.x);
		vrgb.z = rgbhue(v1, v2, hsl.x-0.3333333333333);
	}
	return vrgb;
}
vec4 hsl2rgb_vec4(vec4 hsl) {
	vec4 vrgba;
	vrgba.rgb = hsl2rgb_vec3(hsl.rgb);
	vrgba.a = hsl.a;
	return vrgba;
}



void main() {
	vec4 in1 = textureJit0(tin1, texcoord1);
	
	
	
	
	vec3 vec_13 = (vec3(hue_shift, 0.0, 0.0));
	vec4 rgb2hsl_16 = ((rgb2hsl_vec4(in1)));
	vec4 add_15 = (rgb2hsl_16 + vec4(vec_13, 0.0));
	vec4 hsl2rgb_14 = ((hsl2rgb_vec4(add_15)));
	gl_FragData[0] = hsl2rgb_14;
}
