//Interacting circle objects.

//Controls:
//  s:     Toggle Drawing Circles
//  space: remove all circles
//  click: add circles
//  0,1:   change interaction style

//This is based on code "Generative Art; A practical guide using processing" by matt pearson
//http://zenbullets.com/book.php

//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com


int _num = 5;
Circle[] _circleArr = {};
boolean _drawCircles=true;
int _connectionStyle=1;

void setup() {
  size(800, 800);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
  textSize(32);
  frameRate(24);
}
void draw() {
  background(255);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
  fill(0, 102, 153);
  text(str(_circleArr.length), 0, 32);
}
void mouseReleased() {
  drawCircles();
}
void keyPressed() {
  switch(key){
  case ' ':
    _circleArr=new Circle[0];
    break;
  case ENTER:
    _drawCircles = !_drawCircles;
    break;
  case 's':
    save("Outputs/circles"+"-"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".png");
    save("Outputs/circles"+"-"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second());
    break;
  }
  if(Character.isDigit(key)){
    _connectionStyle=int(key)-48;
  }
}
  void drawCircles() {
  for (int i = 0; i < _num; i++) {
    Circle thisCirc = new Circle();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}
class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float startAlpha;
  float alpha;
  float xMove, yMove;

  Circle() {
    x = random(width);
    y = random(height);
    radius=random(100)+10;
    linecol=color(random(255), random(255), random(255));
    fillcol=color(random(255), random(255), random(255));
    startAlpha  =random(255);
    alpha=startAlpha;
    xMove=random(10)-5;
    yMove=random(10)-5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alpha);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    strokeWeight(1);
    noFill();
    ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x += xMove;
    y += yMove;
    if (x>width+radius)  x= -radius;
    if (x<-radius)       x= width+radius;
    if (y>height+radius) y= -radius;
    if (y<-radius)       y= height+radius;

    boolean touching=false;
    for (Circle other : _circleArr) {
      if (other != this) {
        float distance = dist(x, y, other.x, other.y);
        float overlap = distance-radius-other.radius;
        if (overlap<0) {
          touching=true;
          overlap*=-1;
          drawConnection(x,y,other.x,other.y,fillcol,overlap);
        }
      }
    }
    if (touching) {
      alpha--;
    } else alpha = startAlpha + (startAlpha+alpha)/3;
    if(_drawCircles) drawMe();
  }
}
void drawConnection(float x1,float y1,float x2,float y2,color fillCol,float overlap){
  float midx, midy;
  midx = (x1+x2)/2;
  midy = (y1+y2)/2;
  switch(_connectionStyle){
    case 0: 
      stroke(0,100);
      noFill();
      ellipse(midx,midy,overlap,overlap);
      break;
    case 1:
      stroke(fillCol);
      pushMatrix();
      translate(x1,y1);
      float angle = atan2(y2-y1,x2-x1);
      rotate(angle);
      strokeWeight(10);
      line(0,0,dist(x1,y1,x2,y2),0);
      popMatrix();
      break;
  }
}