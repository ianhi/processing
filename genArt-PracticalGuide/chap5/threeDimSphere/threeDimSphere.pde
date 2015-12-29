//Learning to make 3D graphics with processing.

//This is based on code "Generative Art; A practical guide using processing" by matt pearson
//http://zenbullets.com/book.php

//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com


import processing.opengl.*;
int radius = 100;
void setup() {
  size(500, 300, OPENGL);
  background(255);
  stroke(0);
}
void draw() {
  background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount * .03);
  rotateX(frameCount * .04);
  
  float s = 0;
  float t = 0;
  
  float lastX=0;
  float lastY=0;
  float lastZ=0;
  
  while(t<180){
    s +=18;
    t+=1;
    float radianS=radians(s);
    float radianT=radians(t);
    
    float thisX = radius*cos(radianS)*sin(radianT);
    float thisY = radius*sin(radianS)*sin(radianT);
    float thisZ = radius*cos(radianT);
    if (lastX != 0){
      line(thisX,thisY,thisZ,lastX,lastY,lastZ);
    }
    lastX=thisX;
    lastY=thisY;
    lastZ=thisZ;
  }
}