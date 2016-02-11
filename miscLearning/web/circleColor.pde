color col;
float diameter; 
float angle = 0;

void setup(){
  size(300,300);
  diameter = height - 200;
  noStroke();  
  col=color(0,0,0);
}

void draw(){
  background(220);
  fill(col);
  float rad = 50 + (sin(angle) * diameter/2) + diameter/2;
  ellipse(width/2,height/2,rad,rad);
  angle += 0.02;

}

void setColor(int num){
  if (num==1){
      col=color(255,0,0);
  }
  if (num==2){
      col=color(0,255,0);
   }
  if (num==3){
      col=color(0,0,255);
   }
}