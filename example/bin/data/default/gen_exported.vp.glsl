

varying vec2 texcoord1;
varying vec2 texcoord2;
varying vec2 flip1;
varying vec2 flip1_offset;
varying vec2 flip2;
varying vec2 flip2_offset;
varying vec2 texdim1;
varying vec2 texdim2;






void main() {
	
	
	
	texcoord1 = vec2(gl_TextureMatrix[0]*gl_MultiTexCoord0);
	texcoord2 = vec2(gl_TextureMatrix[1]*gl_MultiTexCoord1);
	texdim1 = vec2(gl_TextureMatrix[0][0][0],gl_TextureMatrix[0][1][1]);
	texdim2 = vec2(gl_TextureMatrix[1][0][0],gl_TextureMatrix[1][1][1]);
	flip1 = texdim1/abs(texdim1);
	flip1.y *= -1.;
	flip1_offset = vec2(0., abs(min(flip1.y, 0.)));
	
	flip2 = texdim2/abs(texdim2);
	flip2.y *= -1.;
	flip2_offset = vec2(0., abs(min(flip2.y, 0.)));
	
	texdim1 = abs(texdim1);
	texdim2 = abs(texdim2);
	gl_Position = ftransform();
}
