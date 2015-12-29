//Visualization of 3D Perlin noise

//This is based on code "Generative Art; A practical guide using processing" by matt pearson
//http://zenbullets.com/book.php

//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com

float xStart=0;
float yStart=1000;
float zStart=10000;

float xNoise,yNoise,zNoise;

int sideLength=200;
int spacing=5;

void setup(){
  size(500,300,P3D);
  background(0);
  noStroke();
}

void draw(){
  background(0);
  
  float xNoise=xStart;
  float yNoise=yStart;
  float zNoise=zStart;
  
  //translate(150,0,0);
  translate(150,20,-150);
  rotateY(frameCount*.1);
  rotateZ(frameCount*.1);
  
  for(int z=0;z<=sideLength;z+=spacing){
    zNoise+=.1;
    yNoise=yStart;
    
    for(int y=0;y<=sideLength;y+=spacing){
      yNoise+=.1;
      xNoise=xStart;
      for(int x=0;x<sideLength;x+=spacing){
        xNoise+=.1;
        drawPoint(x,y,z,noise(xNoise,yNoise,zNoise));
      }
    }
  }
}
void drawPoint(float x, float y, float z, float noiseFactor){
  pushMatrix();
  translate(x,y,z);
  float gray=noiseFactor*255;
  fill(gray,10);
  box(spacing,spacing,spacing);
  popMatrix();
}