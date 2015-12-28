void setup(){
  size(800,800);
  background(0);
  stroke(255);
  strokeWeight(5);
  noFill();
  smooth();
  float reduction = .72;
  float reductionMultiplier = 1.08;
  float radInc = PI/10;
  println(year());
  println(month());
  println(day());
  println(hour());
  println(minute());

//  arc(width/2, height/2, width/2, height/2, 0, 2*PI-radInc);
//  arc(width/2, height/2, (width/2)/reduction, (height/2)/reduction, -radInc, 2*PI-2*radInc);
//  reduction *=reduction;
//  arc(width/2, height/2, (width/2)/reduction, (height/2)/reduction, -2*radInc, 2*PI-3*radInc);
  for(int i =0;i<20;i++){
    arc(width/2,height/2,(width/2)/(reduction*reduction),(height/2)/(reduction*reduction), -i*radInc, 2*PI-(i+1)*radInc-.2);
    reduction*=reductionMultiplier;
    
  }
  save("walker"+dateFormat.format(date)+".png");
  save("perlinWalker"+dateFormat.format(date));
}
void Draw(){
  noLoop();
}

//void keyPressed(){
//  if(key==' '){
//  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
//  //get current date time with Date()
//  Date date = new Date();
//    save("walker"+dateFormat.format(date)+".png");
//    save("perlinWalker"+dateFormat.format(date));
 
//  }
//}