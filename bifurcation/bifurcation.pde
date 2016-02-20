import processing.pdf.*;

float logistic(float a, float x){
  return a * x * (1 - x);
}
 
void setup(){

  background(256, 256, 256);
  size(600, 600,PDF,"~/bifur.pdf");
  //fullScreen(); 
  int i, j;
  int iteration_num = 300;
  float step_size = 0.001;
  float initial_value = 0.1;
  float a = 0;
  float val;
  //stroke(255,0,0,130);
  //noFill();
  noStroke();;
  fill(30,100);
  for(a = 2; a < 4.0 ; a+=step_size){
    val = initial_value;
     
    for(i = 0; i < iteration_num; i++){
      val = logistic(a, val);
      if(i > 100){
        float x = map(a,2,4,0,width);
        float y = map(val,0,1,height,0);
        //point(x,y);
        ellipse(x,y,1,1);
      }
    }
  }
}