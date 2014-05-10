#pragma once

#include "ofShader.h"

#define OFX_MAXGENGLSLLOADER_BEGIN_NAMESPACE namespace ofxMaxGenGlslLoader {
#define OFX_MAXGENGLSLLOADER_END_NAMESPACE }

OFX_MAXGENGLSLLOADER_BEGIN_NAMESPACE

class Util
{
public:
	static string replace(string str, map<string,string> &rep);
};

class Shader : public ofShader
{
public:
	union Uniform {
		int i[4];
		float f[4];
		float mat[16];
		int tex;
	};
	void load(const string &jxs);
	void addReplaceString(const string &from, const string &to) {
		replace_[from] = to;
	}
private:
	map<string,string> replace_;
	map<string,Uniform> uniform_;
private:
	void bindParam(const string &str);
};


OFX_MAXGENGLSLLOADER_END_NAMESPACE

/* EOF */