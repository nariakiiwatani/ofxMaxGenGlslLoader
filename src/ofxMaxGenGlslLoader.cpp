#include "ofxMaxGenGlslLoader.h"
#include "ofXml.h"

OFX_MAXGENGLSLLOADER_BEGIN_NAMESPACE

string Util::replace(string str, map<string,string> &rep)
{
	for(auto it : rep) {
		string key = it.first;
		size_t pos = str.find(it.first);
		while(pos != string::npos) {
			str.replace(pos, it.first.size(), it.second);
			pos = str.find(it.first);
		}
	}
	return str;
}

void Shader::load(const string &jxs)
{
	// please add if something else required.
	addReplaceString("samplerJit0", "sampler2D");
	addReplaceString("textureJit0", "texture2D");
	addReplaceString("samplerJit1", "sampler2D");
	addReplaceString("textureJit1", "texture2D");

	string dir = ofFilePath::getEnclosingDirectory(jxs);
	ofXml xml(jxs);
	xml.setTo("language");
	if(xml.setToChild(0)) {
		do {
			string name = xml.getName();
			if(name == "program") {
				const string &shader_str = Util::replace(ofBufferFromFile(dir+"/"+xml.getAttribute("source")).getText(), replace_);
				const string &type = xml.getAttribute("type");
				if(type == "vertex") {
					setupShaderFromSource(GL_VERTEX_SHADER, shader_str);
				}
				else if(type == "fragment") {
					setupShaderFromSource(GL_FRAGMENT_SHADER, shader_str);
				}
			}
		} while(xml.setToSibling());
	}
	linkProgram();
}

OFX_MAXGENGLSLLOADER_END_NAMESPACE

/* EOF */