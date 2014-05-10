#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	ofSetFrameRate(30);
	ofDisableArbTex();	// max generated shaders have 0-1 texcoord range.
	default_.load("default/gen_exported.jxs");
	help1_.load("help_basic/gen_exported.jxs");
	help2_.load("help_exportcode/gen_exported.jxs");
	ofLoadImage(tex1_, "ofxlogo.png");
	ofLoadImage(tex2_, "0.jpg");
	active_index_ = 0;
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	ofBackground(0);
	switch(active_index_) {
		case 0:
			default_.begin();
			default_.setUniformTexture("tin1", tex1_, 0);
			default_.setUniformTexture("tin2", tex2_, 1);
		{
			float w = ofGetWidth();
			float h = ofGetHeight();
			glBegin(GL_QUADS);
			glMultiTexCoord2d(0, 0,0);
			glMultiTexCoord2d(1, 0,0);
			glVertex2d(0,0);
			glMultiTexCoord2d(0, 1,0);
			glMultiTexCoord2d(1, 1,0);
			glVertex2d(w,0);
			glMultiTexCoord2d(0, 1,1);
			glMultiTexCoord2d(1, 1,1);
			glVertex2d(w,h);
			glMultiTexCoord2d(0, 0,1);
			glMultiTexCoord2d(1, 0,1);
			glVertex2d(0,h);
			glEnd();
		}
			default_.end();
			break;
		case 1:
			help1_.begin();
			help1_.setUniform1f("hue_shift", ofRandom(1));
			tex2_.draw(0,0);
			help1_.end();
			break;
		case 2:
			help2_.begin();
			help2_.setUniform1f("amp", 3);
			tex1_.draw(0,0);
			help2_.end();
			break;
	}
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	switch(key) {
		case '1':	active_index_ = 0;	break;
		case '2':	active_index_ = 1;	break;
		case '3':	active_index_ = 2;	break;
	}
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
