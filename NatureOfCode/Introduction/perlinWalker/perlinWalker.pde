import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

class Walker {
  float x=width/2;
  float y=height/2;
  float tx,ty;
  int maxStep=10;
  float Color;
  float r,g,b,alpha;
  Walker() {
    tx = 0;
    ty = 10000;
    Color=255;
    println(height);
    println(width);
  }
  void step() {
    //x = map(noise(tx),0,1,0,width);
    //y = map(noise(ty),0,1,0,height);
   float stepx = map(noise(tx),0,1,-maxStep,maxStep);
   float stepy = map(noise(ty),0,1,-maxStep,maxStep);
   Color = map(noise(tx+50000),0,1,0,255);
   r =  map(noise(tx+50000),0,1,0,255);
   g =  map(noise(tx+100000),0,1,0,255);
   b =  map(noise(tx+1500000),0,1,0,255);
   alpha = map(noise(tx+2500000),0,1,0,255)-tx/100000;
   x+=stepx;
   y+=stepy;
   if(x>width || x < 0){
     x-=2*stepx;
     tx += 10;
   }
   if(abs(y)>height||y<0){
     y-=2*stepy;
     ty+=10;
   }
    tx += .01;
    ty += .01;
  }
  void Display(){
    fill(Color,alpha);
    //fill(r,g,b,alpha);
    ellipse(x,y,16,16);
  }
}
Walker w;
void setup(){
  size(800,800);
  w = new Walker();
  frameRate(100);
    noStroke();
  
}
void draw(){
  w.step();
  w.Display();

}
void keyPressed(){
  if(key==' '){
  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
  //get current date time with Date()
  Date date = new Date();
    save("walker"+dateFormat.format(date)+".png");
    save("perlinWalker"+dateFormat.format(date));
 
  }
}