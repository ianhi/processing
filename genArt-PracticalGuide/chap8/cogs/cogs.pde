//cog fractal
//I am following "Generative Art; A practical guide using processing" by matt pearson
//http://zenbullets.com/book.php

//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com
//====================================================================
int _maxLevels=5;
int _numChildren=3;

Branch _trunk,_trunk2;

void setup(){
  size(750,800);
  //fullScreen();
  background(255);
  noFill();
  smooth();
  newTree();
  frameRate(10);
}

void draw(){
  background(255);
  _trunk.updateMe(width/2,height/2);
  _trunk.drawMe();
  _trunk2.updateMe(width/4,height/2);
  _trunk2.drawMe();
  
}
void newTree(){
  _trunk = new Branch(1,0,width/2,width/2);
  _trunk.drawMe();
  _trunk2 = new Branch(1,0,width/2,width/2);
  _trunk2.drawMe();
}
class Branch{
  float level,index;
  float x,y;
  float endx,endy;
  float strokeW,alpha;
  float len,lenChange;
  float rot,rotChange;
  
  Branch[] children = new Branch[0];
  Branch(float lev,float ind,float ex,float why){
    level=lev;
    index=ind;
    strokeW=(1/level)*100;
    alpha=255/level;
    len=(1/level)*random(200);
    rot=random(360);
    lenChange=random(-10,10);
    rotChange=random(-5,5);
    updateMe(ex,why);
    if(level<_maxLevels){
      children=new Branch[_numChildren];
      for(int i=0;i<_numChildren;i++){
        children[i] = new Branch(level+1,i,endx,endy);
      }
    }
  }
  void updateMe(float ex,float why){
    x=ex;
    y=why;
    
    rot+=rotChange;
    if(rot>360) rot=0;
    else if(rot<0) rot=360;
    len -=lenChange;
    if(len<0 || len>200) lenChange*=-1;
    
    float radian =radians(rot);
    endx = x+len*cos(radian);
    endy = y+len*sin(radian);
    
    for(int i=0;i<children.length;i++){
      children[i].updateMe(endx,endy);
    }
  }
  void drawMe(){
    stroke(0,alpha);
    strokeWeight(strokeW);
    fill(255,alpha);
    line(x,y,endx,endy);
    ellipse(x,y,5,5);
    
    for(int i=0;i<children.length;i++){
      children[i].updateMe(endx,endy);
      children[i].drawMe();
    }
  }
}