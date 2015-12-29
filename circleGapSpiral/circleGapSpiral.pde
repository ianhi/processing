//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com

//=======================================
// Change this variable to choose between a static image and animation
boolean ANIMATION = true;
//boolean ANIMATION = false;
//========================================

float reductionStart = .72;
float reductionMultiplier = 1.08;
float radInc = PI/10;
float phaseShift=0;

void setup(){
  size(800,800);
  background(0);
  stroke(255);
  strokeWeight(6);
  smooth();
  noFill();
  if (!ANIMATION){
    staticImage();
    noLoop();
  }

}
void draw(){
  background(0);
  float reduction=reductionStart;
  for(int i =0;i<20;i++){
    //arc(width/2,height/2,(width/2)/(reduction*reduction),(height/2)/(reduction*reduction), (-i*radInc+phaseShift), 2*PI-(i+1)*radInc-.2+phaseShift);
    
    //Below are several other styles of animation. They're ordered by which i like the best
    
   if(abs(-i*radInc-phaseShift)<abs(2*PI-(i+1)*radInc-.2+phaseShift)){
   arc(width/2,height/2,(width/2)/(reduction*reduction),(height/2)/(reduction*reduction), abs(-i*radInc-phaseShift)%TWO_PI, abs(2*PI-(i+1)*radInc-.2+phaseShift)%TWO_PI);
   }
   else{
        arc(width/2,height/2,(width/2)/(reduction*reduction),(height/2)/(reduction*reduction), abs(2*PI-(i+1)*radInc-.2+phaseShift),abs(-i*radInc-phaseShift));
   }
   //arc(width/2,height/2,(width/2)/(reduction*reduction),(height/2)/(reduction*reduction), (-i*radInc+phaseShift)%TWO_PI, abs(2*PI-(i+1)*radInc-.2-phaseShift)%TWO_PI);
    //arc(width/2,height/2,(width/2)/(reduction*reduction),(height/2)/(reduction*reduction), abs(-i*radInc+phaseShift), abs(2*PI-(i+1)*radInc-.2-phaseShift));
  reduction*=reductionMultiplier;
  }
  phaseShift+=-.01*PI;
}
void keyPressed(){
  if(key=='s'){
    save("Outputs/gapSpiral"+year()+month()+day()+"-"+hour()+"-"+minute()+"-"+second()+".png");
    save("Outputs/gapSpiral"+year()+month()+day()+hour()+minute()+"-"+second());
  }
}
void staticImage(){
  float reduction=reductionStart;
  for(int i =0;i<20;i++){
    arc(width/2,height/2,(width/2)/(reduction*reduction),(height/2)/(reduction*reduction), -i*radInc, 2*PI-(i+1)*radInc-.2);
    reduction*=reductionMultiplier;
  }
  save("Outputs/gapSpiral"+year()+month()+day()+hour()+minute()+"-"+second()+".png");
  save("Outputs/gapSpiral"+year()+month()+day()+hour()+minute()+"-"+second());
}