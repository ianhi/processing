import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

float power = 2; // Turbulence power
float d = 50; // Turbulence density
void setup()
{noStroke();
 size(800,800);
}
void draw(){
 for (int y = 0; y < height; y++) {
   for (int x = 0; x < width; x++) {
     //float total = 0.0;
     // for (float i = d; i >= 1; i = i/1.5) {
     //    total += noise(x/d, y/d) ;
     //  }
     ////float turbulence = 128.0 * total ;
     float turbulence = 2*PI *noise(x/d, y/d) ;
     float base = (x * 0.2) + (y * 0.02);
     //float offset = base + (power * turbulence / 256.0);
     float offset = base + power*turbulence;
     float gray = abs(sin(offset)) * 256.0;
     stroke(gray);
   point(x, y);
    }
 }
}
 void keyPressed(){
  if(key==' '){
  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
  //get current date time with Date()
  Date date = new Date();
    save("noise"+dateFormat.format(date)+".png");
    //save("perlinWalker"+dateFormat.format(date));
 
  }
}