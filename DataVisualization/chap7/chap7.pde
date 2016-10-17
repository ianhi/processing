Node[] folders = new Node[10];
int folderCount;
int folderIndex;
Node rootNode;
void setup() {
  size(400, 130);
  File rootFile = new File("/home/ian/Documents/processing");
  if (!rootFile.isDirectory()) {
    println("NOT A DIRECTORY");
  }
  PFont font = createFont("SansSerif", 11);
  textFont(font);
  rootNode = new Node(rootFile);
}
boolean drawStatus() {
  float statusX = 30;
  float statusW = width - statusX*2;
  float statusY = 60;
  float statusH = 20;
  boolean done = false;
  fill(0);
  if (folderIndex != folderCount) {
    text("Reading "+nfc(folderIndex+1) + " out of " + nfc(folderCount) + " folders...", 
      statusX, statusY-10);
  } else {
    text("Done reading.", statusX, statusY-10);
    done = true;
  }
  fill(128);
  rect(statusX, statusY, statusW, statusH);
  float completedW = map(folderIndex + 1, 0, folderCount, 0, statusW);
  fill(255);
  rect(statusX, statusY, completedW, statusH);
  return done;
}
void draw() {
  background(128);
  rootNode.nextFolder();
  if(drawStatus()){
    rootNode.printList();
    noLoop();
  }
}