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
			if(name == "bind") {
				uniform_[xml.getAttribute("param")] = Uniform();
			}
			else if(name == "program") {
				const string &shader_str = Util::replace(ofBufferFromFile(dir+"/"+xml.getAttribute("source")).getText(), replace_);
				bindParam(shader_str);
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

void Shader::bindParam(const string &str)
{
	// currently doing nothing...
	return;
	const char *find_str = "uniform ";
	ofBuffer buf(str);
	string line = buf.getFirstLine();
	while(!buf.isLastLine()) {
		size_t pos = str.find(find_str);
		if(pos == 0) {
			char *declare = &line[strlen(find_str)];
			char type[16]={};
			char name[128]={};
			sscanf(declare, "%s %s;", type, name);
			for(auto it : uniform_) {
				if(strcmp(name, it.first.c_str())==0) {
					switch(declare[0]) {
						case 'f':	// float
							break;
						case 'm':	// matrix
							break;
						case 'i':	// int
							break;
							
					}
				}
			}
		}
		line = buf.getNextLine();
	}
}

OFX_MAXGENGLSLLOADER_END_NAMESPACE

/* EOF */