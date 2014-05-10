

varying vec2 texcoord1;
varying vec2 flip1;
varying vec2 flip1_offset;
varying vec2 texdim1;






void main() {
	
	
	
	texcoord1 = vec2(gl_TextureMatrix[0]*gl_MultiTexCoord0);
	texdim1 = vec2(gl_TextureMatrix[0][0][0],gl_TextureMatrix[0][1][1]);
	flip1 = texdim1/abs(texdim1);
	flip1.y *= -1.;
	flip1_offset = vec2(0., abs(min(flip1.y, 0.)));
	
	texdim1 = abs(texdim1);
	gl_Position = ftransform();
}
