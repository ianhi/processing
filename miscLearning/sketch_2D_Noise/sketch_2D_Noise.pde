float tx=0;
float ty=10000;
void setup(){
  size(800,800);
  frameRate(15);

}
void draw(){
  loadPixels();
  float xoff = 4.0;

  for (int x = 0; x < width; x++) {
    float yoff =0.0;
    for (int y = 0; y < height; y++) {
      //if(y<height/2) noiseDetail(10);
      //else noiseDetail(1);
      float bright = map(noise(xoff,yoff,ty+1000),0,1,0,255);
      //float bright = map(noise(round(x/10),round(y/10)),0,1,0,255);
      //float r = map(noise(x*tx+1000,y),0,1,0,255);
      //float g = map(noise(x*tx+10000,y),0,1,0,255);
      //float b = map(noise(x*tx+100000,y),0,1,0,255);
      //pixels[x+y*width] = color(r,g,b,bright);
      pixels[x+y*width] = color(bright);
      yoff+=.01;
     }
     xoff +=.01;
  }
  tx+=.1;
  ty+=.05;
  updatePixels();
 // noLoop();
}