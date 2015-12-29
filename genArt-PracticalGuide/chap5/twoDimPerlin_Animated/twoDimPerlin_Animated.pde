//Visualization of 2D Perlin noise - Animated
//change the drawPoint method to drawPoint[2/3] to change the vizsulation method.

//This is based on code "Generative Art; A practical guide using processing" by matt pearson
//http://zenbullets.com/book.php

//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com

float xStart,xNoise,yStart,yNoise;
float xStartNoise, yStartNoise;
void setup(){
  size(800,300);
  smooth();
  background(255);
  xStart = 0;
  yStart = 1000;
  xStartNoise=10000;
  yStartNoise=100000;
  frameRate(30);
  

}
void draw(){
  background(255);
  for (int y=0;y<height;y+=5){
    yNoise+=.1;
    xNoise=xStart;
    for (int x =0;x<=width;x+=5){
      xNoise+=.1;
      drawPoint(x,y,noise(xNoise,yNoise));
    }
  }
  float stepSize=.05;
  xStart+=map(noise(xStartNoise),0,1,-stepSize,stepSize);
  yStart+=map(noise(yStartNoise),0,1,-stepSize,stepSize);
  
  xStartNoise+=.01;
  yStartNoise+=.01;
  
  xNoise=xStart;
  yNoise=yStart;
}
void drawPoint(float x,float y,float noiseFactor){
  float len = 10*noiseFactor;
  rect(x,y,len,len);
}
void drawPoint2(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor * radians(360));
  stroke(0, 150);
  line(0,0,20,0);
  popMatrix();
}
void drawPoint3(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  noStroke();
  fill(grey, alph);
  ellipse(0,0, edgeSize, edgeSize/2);
  popMatrix();
}