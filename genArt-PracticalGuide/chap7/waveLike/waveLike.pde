//Cellular Automata variant
//I am following "Generative Art; A practical guide using processing" by matt pearson
//http://zenbullets.com/book.php

//Author Ian Hunt-Isaak
//ianhi.github.io
//ianhuntisaak [atNOSPAM] gmail.com
//====================================================================
Cell[][] _cellArray;
int _cellSize=10;
int _numX, _numY;

void setup(){
  size(800,600);
  _numX=floor(width/_cellSize);
  _numY=floor(height/_cellSize);
  restart();
}
void restart(){
  _cellArray=new Cell[_numX][_numY];
  for(int x=0;x<_numX;x++){
    for(int y=0;y<_numY;y++){
      _cellArray[x][y] = new Cell(x,y);
    }
  }
  
  for(int x=0;x<_numX;x++){
    for(int y=0;y<_numY;y++){
      
      int above = y-1;
      int below = y+1;
      int left  = x-1;
      int right = x+1;
      
      if(above<0)      above=_numY-1;
      if(below==_numY) below =0;
      if(left<0)       left = _numX-1;
      if(right==_numX) right =0;
      
      _cellArray[x][y].addNeighbor(_cellArray[left][above]);
      _cellArray[x][y].addNeighbor(_cellArray[left][y]);
      _cellArray[x][y].addNeighbor(_cellArray[left][below]);
      _cellArray[x][y].addNeighbor(_cellArray[x][above]);
      _cellArray[x][y].addNeighbor(_cellArray[x][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][above]);
      _cellArray[x][y].addNeighbor(_cellArray[right][y]);
      _cellArray[x][y].addNeighbor(_cellArray[right][below]);
    }
  }
}
void draw(){
  background(200);
  
  for(int x=0;x<_numX;x++){
    for(int y=0;y<_numY;y++){
      _cellArray[x][y].calcNextState();
    }
  }
  
  translate(_cellSize/2,_cellSize/2);
  for(int x=0;x<_numX;x++){
    for(int y=0;y<_numY;y++){
      _cellArray[x][y].drawMe();
    }
  }
}

void mousePressed(){
  restart();
}

//=================OBJECT============================

class Cell{
  float x,y;
  float state;
  float  nextState;
  float lastState;
  Cell[] neighbors;
  
  Cell(float ex,float why){
    x=ex*_cellSize;
    y=why*_cellSize;
    

    //nextState=random(255)*x*y*y%255;
    /*
    if(x<width/2+50 && x>width/2-50){
      nextState=255;
    } else{
      nextState=0;
    }
    */
    
    //nextState=((x/width)+y/height)*14;
    
    nextState=255*y*y*pow(x,10)%255;
    if(ex<_numX/2+10 && ex>(_numX/2-10)){
      println("in if");
      nextState=255;
    } 
    
    state=nextState;
    
    neighbors=new Cell[0];
  }
  
  void addNeighbor(Cell cell){
    neighbors=(Cell[]) append(neighbors,cell);
  }
  void calcNextState(){
    float total=0;
    for(int i=0;i<neighbors.length;i++){
      total+=neighbors[i].state;
    }
    float average = int(total/9);
    
    if(average==255){
      nextState=0;
    }else if(average==0){
      nextState=255;
    } else{
      nextState = state+average;
      if(lastState>0) nextState-=lastState;
      if(nextState>255) nextState=255;
      if(nextState<0) nextState=0;
    }
    lastState=state;
  }
  void drawMe(){
    state=nextState;
    stroke(0);
    fill(state);
    ellipse(x,y,_cellSize,_cellSize);
    //point(x,y);
  }
}


void keyPressed(){
  if(key=='s'){
    save("Outputs/CA-"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".png");
    save("Outputs/CA-"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second());
  }
}