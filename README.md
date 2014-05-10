# ofxMaxGenGlslLoader
by nariakiiwatani

loading shader exported from jit.gl.pix

It isn't tested enough, so please report an issue if somethign is wrong.

## Usage...
### Export shader code from jit.gl.pix
send message "exportcode" to your jit.gl.pix

notice: you have to export in jxs format.(not webgl)

### Load jxs

	ofxMaxGenGlslLoader::Shader shader;
	shader.load("gen_exported.jxs");

As ofxMaxGenGlslLoader::Shader extends ofShader, you can use it as a normal ofShader.
