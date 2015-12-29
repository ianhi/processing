//I am following "Generative Art; A practical guide using processing" by matt pearson
//http://zenbullets.com/book.php

//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com
//====================================================================

int step =10;
float lastx = -999;
float lasty = -999;
float y =50;
int borderx = 20;
int bordery=10;


void setup(){
  size(500,400);

  strokeWeight(5);
  smooth();
  drawThings();

}
void draw(){
}

void drawThings(){
  background(255);
  stroke(204);
  line(borderx,height/2,width-borderx,height/2);
  stroke(20,50,70);
  for(int x=borderx;x<=width-borderx;x+=step){
    //y=bordery+random(height-2*bordery);
   y=height/2+(height/2-bordery)*sin(map(x,20,480,0,2*PI));
    if(lastx>-999){
      //line(x,y,lastx,lasty);
      line(x,y,lastx,lasty);
    }
    //lastx = x;
    //lastx=x+11;  // creates slightly bent organic looking veritical lines
    lastx=x+20;
    //lastx=x+10;  //creates neat vertical lines
    lasty=y;
  }
  lastx=-999;
  lasty=-999;
}
void mousePressed(){
  drawThings();
}
