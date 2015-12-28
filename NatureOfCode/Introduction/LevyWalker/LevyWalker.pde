float monteCarlo(){
  while (true) {
    float r1 = random(1);
    float probability = r1;
    float r2 = random(1);
    
    if (r2 < probability) {
      return r1;
    }
  }

}

import java.util.*; 
Random generator;

float sd=.7;

class Walker{
 int x;
 int y;
 Walker(){
   x = width/2;
   y = height/2;
 }
 void display(){
   stroke(0);
   point(x,y);
 }
 void step(){
  float stepsize = monteCarlo()*10;
  
  float stepx = random(-stepsize,stepsize);
  float stepy = random(-stepsize,stepsize);

  x += round(stepx);
  y += round(stepy);
 }
}
Walker w;
void setup(){
  size(640,360);
  w = new Walker();
  generator = new Random();
  background(255);
  frameRate(200);
}
void draw(){
  w.step();
  w.display();
}
void mousePressed(){
  noLoop();
}
  