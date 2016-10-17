
class Walker {
  float x=width/2;
  float y=height/2;
  float tx, ty;
  int maxStep=30;
  Ring[] rings;
  int numRings = 200;
  int currentRing = 0;
  int ringRate;
  int width_; // width availiable to walker
  int height_; //height availiable to walker

  Walker(int maxStep_, int ringRate_,int w, int h) {
    tx = 0;
    ty = 10000;

    maxStep=maxStep_;
    ringRate=ringRate_;
    width_ = w;
    height_= h;
    rings = new Ring[numRings];
    for (int i = 0; i < rings.length; i++) {
      rings[i] = new Ring(); // Create each object
    }
  }
  void step() {
    float stepx = map(noise(tx), 0, 1, -maxStep, maxStep);
    float stepy = map(noise(ty), 0, 1, -maxStep, maxStep);

    x+=stepx;
    y+=stepy;
    if (x>width_ || x < 0) {
      x-=2*stepx;
      tx += 10;
    }
    if (abs(y)>height_ || y<0) {
      y-=2*stepy;
      ty+=10;
    }
    tx += .01;
    ty += .01;
    if (frameCount%ringRate == 0) {
      rings[currentRing].start(x, y);
      currentRing = (currentRing+1)%numRings;
    }
  }
  void Display() {
    for (int i = 0; i < rings.length; i++) {
      rings[i].grow();
      rings[i].display();
    }
    fill(255);
    ellipse(x, y, 16, 16);
  }
}