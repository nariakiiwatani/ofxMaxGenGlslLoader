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
	void load(const string &jxs);
	void addReplaceString(const string &from, const string &to) {
		replace_[from] = to;
	}
private:
	map<string,string> replace_;
};


OFX_MAXGENGLSLLOADER_END_NAMESPACE

/* EOF */