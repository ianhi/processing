//I am following "Generative Art; A practical guide using processing" by matt pearson
//http://zenbullets.com/book.php

//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com
//====================================================================
int centX;
int centY;

void setup(){
  size(800,800);
  background(255);
  strokeWeight(.5);
  smooth();
  stroke(20,50,70);
  centX=width/2;
  centY=height/2;
  for(int i=0;i<100;i++){
    drawSpiral();
  }
}



void drawSpiral(){
  float radius = 10;
  float x,y;
  float lastx = centX+radius;
  float lasty = centY;
  float radiusNoise=random(100);
  for(float ang=0;ang<=3600;ang+=5){
    radius+=.5;
    radiusNoise +=.05;
    float thisRadius=radius+noise(radiusNoise)*200-100;
    float rad=radians(ang);
    x = centX + (thisRadius*cos(rad));
    y = centY + (thisRadius*sin(rad));
    line(x,y,lastx,lasty);
    lastx=x;
    lasty=y;
  }
}
