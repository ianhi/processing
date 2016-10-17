
Walker w;

HScrollbar hs1, hs2;  // Two scrollbars

void setup() {
  size(1200, 1200);
  w = new Walker(30, 2,width,height-64);
  hs1 = new HScrollbar(0, height-10, width, 16, 32,"Max Step");
  hs2 = new HScrollbar(0, height-32, width, 16, 32,"Ring Rate");
  frameRate(100);
  noStroke();
}
void draw() {
  background(0);
  w.step();
  w.Display();
  float step = map(hs1.getPos(), 0, width, 0, 100);
  w.maxStep = int(step);
  float rate = map(hs2.getPos(), width, 0, 1,10);
  w.ringRate = int(rate);
  hs1.update();
  hs2.update();
  hs1.display();
  hs2.display();
}