

varying vec2 texcoord1;
varying vec2 flip1;
varying vec2 flip1_offset;
varying vec2 texdim1;
varying vec2 texcoord;





void main() {
	
	
	texcoord = vec2(gl_MultiTexCoord0.x, 1.-gl_MultiTexCoord0.y);
	texcoord1 = vec2(gl_TextureMatrix[0]*gl_MultiTexCoord0);
	texdim1 = vec2(gl_TextureMatrix[0][0][0],gl_TextureMatrix[0][1][1]);
	flip1 = texdim1/abs(texdim1);
	flip1.y *= -1.;
	flip1_offset = vec2(0., abs(min(flip1.y, 0.)));
	
	texdim1 = abs(texdim1);
	gl_Position = ftransform();
}
