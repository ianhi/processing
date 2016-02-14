PImage mapImage;
int rowCount;
Table locationTable;
void setup(){
  size(640,400);
  mapImage = loadImage("map.png");
  
  locationTable = new Table("locations.tsv");
  rowCount = locationTable.getRowCount();
}
void draw(){
  background(255);
  image(mapImage,0,0);
  
  smooth();
  fill(192,0,0);
  noStroke();
  
  for (int row=0;row<rowCount;row++){
    float x = locationTable.getFloat(row,1);
    float y = locationTable.getFloat(row,2);
    ellipse(x,y,9,9);
  }
}