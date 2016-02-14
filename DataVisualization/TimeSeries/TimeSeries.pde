FloatTable data;
float dataMin, dataMax;

int yearMin, yearMax;
int[] years;

float plotX1, plotY1;
float plotX2, plotY2;
float labelX, labelY;

int currentColumn =0;
int columnCount;
PFont plotFont;

int yearInterval = 10;
int volumeInterval = 10;

int volumeIntervalMinor = 5;

void setup() {
  size(720, 405);  
  data = new FloatTable("milk-tea-coffee.tsv");
  columnCount = data.getColumnCount();

  years = int(data.getRowNames());
  yearMin = years[0];
  yearMax = years[years.length-1];
  dataMin = 0;
  dataMax = ceil(data.getTableMax() / volumeInterval)*volumeInterval;

  plotX1 = 120;
  plotX2 = width-80;
  labelX = 50;
  plotY1 = 60;
  plotY2 = height-70;
  labelY = height-25;

  plotFont = createFont("SansSerif", 20);
  textFont(plotFont);

  smooth();
}

void draw() {
  background(255);

  //fill(255);
  //rectMode(CORNERS);
  //noStroke();
  //rect(plotX1, plotY1, plotX2, plotY2);

  drawTitle();

  drawVolumeLabels();
  drawAxisLabels();
  fill(#5679C1);

  // drawDataPoints(currentColumn);
  noStroke();
  //strokeWeight(2);
  //drawDataCurve(currentColumn);
  //drawDataLine(currentColumn);
  drawDataArea(currentColumn);
  drawDataHighlight(currentColumn);
    drawYearLabels();
}

void drawDataPoints(int col) {
  int rowCount = data.getRowCount();
  for (int row = 0; row< rowCount; row++) {
    float value = data.getFloat(row, col);
    float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
    float y = map(value, dataMin, dataMax, plotY2, plotY1);
    point(x, y);
  }
}

void drawYearLabels() {
  fill(0);
  textSize(10);
  textAlign(CENTER, TOP);
  int rowCount = data.getRowCount();

  stroke(255);
  strokeWeight(1);

  for (int row = 0; row < rowCount; row++) {
    if (years[row]%yearInterval==0) {
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
      text(years[row], x, plotY2+10);
      line(x, plotY1, x, plotY2);
    }
  }
}

void drawTitle() {
  fill(0);
  textSize(20);
  textAlign(LEFT);
  String title = data.getColumnName(currentColumn);
  text(title, plotX1, plotY1-10);
}
void drawVolumeLabels() {

  fill(0);
  textSize(10);
  stroke(128);
  strokeWeight(1);


  for (float v = dataMin; v<= dataMax; v += volumeIntervalMinor) {

    if (v % volumeIntervalMinor ==0) {
      float y =  map(v, dataMin, dataMax, plotY2, plotY1);
      if ( v % volumeInterval == 0) {
        if (v == dataMin) textAlign(RIGHT);
        else if (v == dataMax) textAlign(RIGHT, TOP);
        else textAlign(RIGHT, CENTER);
        text(floor(v), plotX1 - 10, y);
        line(plotX1-4, y, plotX1, y);
      } else {
        // line(plotX1-2, y ,plotX1, y);
      }
    }
  }
}
void drawAxisLabels() {
  fill(0);
  textSize(13);
  textLeading(15);

  textAlign(CENTER, CENTER);
  text("Gallons\nconsumed\nper capita", labelX, (plotY1+plotY2)/2);
  textAlign(CENTER);
  text("Year", (plotX1+plotX2)/2, labelY);
}

void drawDataLine(int col) {
  beginShape();
  int rowCount = data.getRowCount();
  for (int row = 0; row<rowCount; row++) {
    float value = data.getFloat(row, col);
    float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
    float y = map(value, dataMin, dataMax, plotY2, plotY1);
    vertex(x, y);
  }
  endShape();
}
void drawDataCurve(int col) {
  beginShape();
  int rowCount = data.getRowCount();
  for (int row = 0; row<rowCount; row++) {
    float value = data.getFloat(row, col);
    float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
    float y = map(value, dataMin, dataMax, plotY2, plotY1);
    curveVertex(x, y);
    if (row == 0 || (row == rowCount - 1)) {
      curveVertex(x, y);
    }
  }
  endShape();
}
void drawDataArea(int col){
    beginShape();
  int rowCount = data.getRowCount();
  for (int row = 0; row<rowCount; row++) {
    float value = data.getFloat(row, col);
    float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
    float y = map(value, dataMin, dataMax, plotY2, plotY1);
    vertex(x, y);
  }
  vertex(plotX2, plotY2);
  vertex(plotX1, plotY2); 
  endShape();
}

void drawDataHighlight(int col) {
  int rowCount = data.getRowCount();
  for (int row=0; row < rowCount; row++) {
    if (data.isValid(row, col)) {
      float value = data.getFloat(row, col);
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
      float y = map(value, dataMin, dataMax, plotY2, plotY1);
      //if(dist(mouseX,mouseY,x,y)<3){
      if (abs(mouseX-x)<3) {
        strokeWeight(10);
        point(x, y);
        fill(0);
        textSize(10);
        textAlign(CENTER);
        text(nf(value, 0, 2) + " ("+years[row] + ")", x, y-8);
      }
    }
  }
}
void keyPressed() {
  if (key == '[') {
    currentColumn--; 
    if (currentColumn < 0) {
      currentColumn = columnCount -1;
    }
  } else if (key == ']') {
    currentColumn = (currentColumn+1)%columnCount;
  }
}