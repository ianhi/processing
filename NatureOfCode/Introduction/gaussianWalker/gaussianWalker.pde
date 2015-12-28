
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
  float num_x = (float) generator.nextGaussian();
  float num_y = (float) generator.nextGaussian();
  int stepx = round(num_x*sd);
  int stepy = round(num_y*sd);
  x += stepx;
  y += stepy;
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
  