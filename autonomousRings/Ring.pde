
class Ring {
  float x, y;          // X-coordinate, y-coordinate
  float diameter;      // Diameter of the ring
  boolean on = false;  // Turns the display on and off
  float rate;

  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos; 
    rate = random(1, 50);
    diameter = 1;
    on = true;
  }

  void grow() {
    if (on == true) {
      diameter += 5;
      if (diameter > width+200 && diameter >height+200) {
        on = false;
        diameter = 1;
      }
    }
  }

  void display() {
    if (on == true) {
      noFill();
      strokeWeight(4);
      stroke(204, 153);
      ellipse(x, y, diameter, diameter);
    }
  }
}