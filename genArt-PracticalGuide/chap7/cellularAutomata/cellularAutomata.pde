//Cellular Automata
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
  boolean state;
  boolean nextState;
  Cell[] neighbors;
  
  Cell(float ex,float why){
    x=ex*_cellSize;
    y=why*_cellSize;
    
    if(random(2)>1) nextState=true;
    else nextState=false;
    
    state=nextState;
    neighbors=new Cell[0];
  }
  
  void addNeighbor(Cell cell){
    neighbors=(Cell[]) append(neighbors,cell);
  }
  void calcNextState(){
    nextState =GOL(neighbors,state);  // Game of Life rules.
    //nextState = V_Vote(neighbors,state); //Vichniac Vote Rule
  }
  void drawMe(){
    state=nextState;
    stroke(0);
    if(state) fill(0); 
    else fill(255);
    ellipse(x,y,_cellSize,_cellSize);
    //point(x,y);
  }
}
//RULES ===============================
boolean GOL(Cell[] neighbors,boolean state){
  boolean nextState;
  int aliveNeighbors=0;
    for(int n=0;n<neighbors.length;n++){
      if(neighbors[n].state) aliveNeighbors++;
    }
    if(state){
      if(aliveNeighbors==2 || aliveNeighbors==3) nextState=true;
      else nextState=false;
    } else{
      if(aliveNeighbors==3) nextState=true;
      else nextState=false;
    }
    return nextState;
}

boolean V_Vote(Cell[] neighbors,boolean state){
  boolean nextState;
  int aliveCount=0;
  
  if(state) aliveCount++;
  for(int n=0;n<neighbors.length;n++){
    if(neighbors[n].state) aliveCount++;
  }
  if(aliveCount<=4) nextState=false;
  else nextState=true;
  
  if(aliveCount==4 || aliveCount==5) nextState = !nextState;
  return nextState;
}

void keyPressed(){
  if(key=='s'){
    save("Outputs/CA-"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".png");
    save("Outputs/CA-"+year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second());
  }
}