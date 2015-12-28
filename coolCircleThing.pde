void setup() {
 size(500, 500, P3D);

 stroke(0, 50);
 fill(255, 200);
 setupJunk();

}
void setupJunk(){
   background(150);
   float xstart = random(10);
 float ynoise = random(10);
 translate(width/2, height/2, 0);
 for (float y = -(height/8); y <= (height/8); y+=3) {
 ynoise += 0.02;
 float xnoise = xstart;
 for (float x = -(width/8); x <= (width/8); x+=3) {
 xnoise += 0.02;
 drawPoint(x, y, noise(xnoise, ynoise));
 }
 }
}
void drawPoint(float x, float y, float noiseFactor) {
 pushMatrix();
 translate(x * noiseFactor * 4, y * noiseFactor * 4, -y);
 float edgeSize = noiseFactor * 26;
 ellipse(0, 0, edgeSize, edgeSize);
 popMatrix();
}
void mousePressed(){
  setupJunk();
}