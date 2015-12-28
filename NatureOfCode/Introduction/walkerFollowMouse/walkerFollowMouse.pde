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
 private int norm(int var){
   if(var!=0){
     return var/abs(var);
   }
   return 0;
 }
 void step(){

  int stepx = int(random(3))-1;
  //float stepx = random(-1,2.1);
  int stepy = int(random(3))-1;
  if(random(1)<=.2){
    stepx = norm(mouseX-x);
    stepy = norm(mouseY-y); //lol division by zero possilble
  } 
  x += stepx;
  y += stepy;
 }
}
Walker w;
void setup(){
  size(640,360);
  w = new Walker();

  background(255);
  frameRate(200);
}
void draw(){
  w.step();
  w.display();
}
  