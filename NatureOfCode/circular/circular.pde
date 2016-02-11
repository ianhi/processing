Mover mover;
float t=0;
void setup() {
  size(640, 360);
  background(230);
  mover = new Mover(1);
  frameRate(60);
  textSize(32);
}
void mousePressed() {
  mover = new Mover(mover.depth+1);
}
void draw() {
  //background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
  t+=.01;
  noStroke();
  rect(0,height-32,20*str(mover.depth).length(),height);
  fill(0);
  text(str(mover.depth),0,height-2);
}
void keyPressed() {
  if (key=='a') {
    mover.accel();
  }
  if (key=='d') {
    mover.deccel();
  }
}
class Mover {
  PVector location;
  PVector location2;
  PVector velocity;  
  PVector acceleration;
  PVector jerk;
  PVector yank;
  float topspeed;
  int depth=10;
  PVector[] vects;
  Mover(int nDepth) {
    depth=nDepth;
    vects= new PVector[depth];
    for (int i=0; i<depth; i++) {
      vects[i]=new PVector(0, 0);
    }
    location = new PVector(width/2, height/2);
    //velocity = new PVector(0, 0);
    //acceleration = new PVector(0, 0);
    //jerk = new PVector(0, 0);
    topspeed=10;
  }
  void update() {
    vects[depth-1].x=sin(t);
    vects[depth-1].y=cos(t);
    for (int i=depth-1; i>0; i--) {
      vects[i].div(depth);
      vects[i-1].add(vects[i]);
    }

    //velocity.y=sin(t);
    //velocity.x=cos(t);

    //acceleration.y=sin(t);
    //acceleration.x=cos(t);

    //jerk.y=sin(t);
    //jerk.x=cos(t);

    //yank.y=sin(t)/10;
    //yank.x=cos(t)/10;


    //jerk.add(yank);
    //acceleration.add(jerk);
    //velocity.add(acceleration);
    //velocity.limit(topspeed);
    //location.add(velocity);
    location=vects[0];
    println(location);
    location2=location;

//location2.mult(200);
    location2.setMag(100);

  }
  void accel() {
    velocity.add(acceleration);
  }
  void deccel() {
    velocity.sub(acceleration);
    if ( velocity.mag()<0) {
      velocity.setMag(0);
    }
  }
  void display() {
    stroke(0);
    fill(175);
    translate(width/2,height/2);
    ellipse(location2.x, location2.y, 16, 16);
  }
  void checkEdges() {
    if (location2.x > width) {
      location2.x = 0;
    } else if (location2.x < 0) {
      location2.x = width;
    }
    if (location2.y > height) {
      location2.y = 0;
    } else if (location2.y < 0) {
      location2.y = height;
    }
  }
}