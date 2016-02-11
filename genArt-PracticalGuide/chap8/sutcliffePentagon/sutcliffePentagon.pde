//FractalRoot pentagon;
int _maxLevels=5;
void setup(){
  size(1000,1000);
  smooth();
  //pentagon = new FractalRoot();
  //pentagon.drawShape();
  //drawPent(width/2,height/2,400);

  drawPent(width/2,height/2,200);
}
class pointObj{
  float x,y;
  pointObj(float ex, float why){
    x=ex; y=why;
  }
}
void drawPent(float centX, float centY,float radius){
  pointObj[] points = new pointObj[5];
  for(int i=0;i<5;i++){
    
    float x = centX+radius*cos(radians(i*72));
    float y = centY+radius*sin(radians(i*72));
    points[i]=new pointObj(x,y);
  }

  (new Branch(0,2,points)).drawMe();
}

class Branch{
  int level, num;
  pointObj[] points={};
  
  Branch(int lev,int n,pointObj[] inputPoints){
    level = lev;
    num = n;
    points=inputPoints;
  }
  void drawMe(){
    println("==================================");
    println(points.length);
    strokeWeight(5-level);
    for(int i=0;i<points.length;i++){
      line(points[i].x,points[i].y,points[(i+1)%5].x,points[(i+1)%5].y);
    }
    if(level <_maxLevels){
      pointObj[] newPoints = {};
      for(int i=0;i<points.length;i++){
        newPoints = (pointObj[])append(newPoints,midPoint(points[i],points[(i+1)%5]));
        
      }
      print("new points: "); println(newPoints.length);
      Branch child = new Branch(level+1,4,newPoints);
      child.drawMe();
    }
  }
}
pointObj midPoint(pointObj p1,pointObj p2){
  float mx,my;
  mx=(p1.x+p2.x)/2;
  my=(p1.y+p2.y)/2;
  return new pointObj(mx,my);
}