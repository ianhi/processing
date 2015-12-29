//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com
//====================================================================
float _angle=0;
float _angleNoise=0;

float _radius;
float _radiusNoise=1000;

float _centX;
float _centY;

float _xNoise=10000;
float _yNoise=100000;

float _alpha=255;
float _alphaNoise=1000000;

void setup(){
  size(800,800);
  background(255);
  _centX=width/2;
  _centY=height/2;
  _radius=((height+width)/2)/3;
  stroke(_alpha,60);
  frameRate(30);

}
void draw(){
  _alpha= map(noise(_alphaNoise),0,1,0,255);
  stroke(_alpha,60);
  //_alpha-=.5;
  
  float thisRadius = _radius+(noise(_radiusNoise)*2-1)*_radius;
  float thisAngle  = radians(_angle +(noise(_angleNoise)*2-1)*20);
  
  float centVariation=5;
  float thisCentX  = _centX +(noise(_xNoise)*2-1)*_centX/centVariation;
  float thisCentY  = _centY +(noise(_yNoise)*2-1)*_centY/centVariation;
  
  _alpha= map(noise(_alphaNoise),0,1,0,255);
  stroke(_alpha,60);
 
  float x1 = thisCentX + thisRadius*cos(thisAngle);
  float y1 = thisCentY + thisRadius*sin(thisAngle);
  
  float x2 = thisCentX + thisRadius*cos(thisAngle+PI);
  float y2 = thisCentY + thisRadius*sin(thisAngle+PI);

  line(x1,y1,x2,y2);
  
  _angleNoise+=.005;
  _radiusNoise+=.05;
  _xNoise+=.005;
  _yNoise+=.005;
  _angle+=.5;  
}

void keyPressed(){
  if(key=='s'){
    save("Outputs/waveClock-"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second());
    save("Outputs/waveClock-"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".png");
  }

}