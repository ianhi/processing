int _num = 5;
Circle[] _circleArr = {};
boolean _drawCircles=true;

void setup() {
  size(1200, 800);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
  textSize(32);
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
          float midx, midy;
          midx = (x+other.x)/2;
          midy = (y+other.y)/2;
          stroke(0, 100);
          noFill();
          overlap*=-1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
    if (touching) {
      alpha--;
    } else alpha = startAlpha + (startAlpha+alpha)/3;
    if(_drawCircles) drawMe();
  }
}