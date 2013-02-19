PGraphics canvas;
int canvas_width = 7500;
int canvas_height = 3600;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


void setup() {
  size(1024, 720); 
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();
  canvas.beginDraw();
  canvas.background(0);
  canvas.smooth();

  //----------------------text--------------------------------------
  PFont font;
  font = loadFont("Arial-Black-20.vlw");
  //canvas.size(200, 200);
  canvas.fill(255);
  canvas.textFont(font);
  canvas.pushMatrix();
  canvas.translate(canvas_width/2, canvas_height/2);
  canvas.rotate(PI/2);
  canvas.text("Mónica Bate - Fundamental", -1600, 0);
  canvas.text("MMXII", 1500, 0);
  // canvas.rotate(-PI);
  canvas.popMatrix();
  //-----------------------------------------------------------------




  PVector linesCloudCenter = new PVector(canvas.width*3/4, canvas.height/2); //defines start of line drawing
  PVector pointsCloudCenter = new PVector(canvas.width*1/6, canvas.height/2); //defines start of points drawing

  float cloudRadius = canvas.height/4; //defines the radius of what will be drawn with lines
  int linesNumber = 1000; //defines amount of lines
  int pointsNumber = 3000; //defines amount of points 

  for (int i=0; i<linesNumber; i++) {

    linesCloudCenter.x += random(-cloudRadius/20, cloudRadius/20);
    linesCloudCenter.y = linesCloudCenter.y + random(-cloudRadius/10, cloudRadius/10); //paso

    canvas.stroke(255);
    canvas.strokeWeight(1.5);
    canvas.noFill();
    canvas.pushMatrix();
    canvas.translate(linesCloudCenter.x, linesCloudCenter.y);
    canvas.rotate(random(-PI, PI)); //rotates de line ccw
    canvas.stroke(255);//, 100*(linesNumber-i)/linesNumber);
    canvas.line(-cloudRadius/5, cloudRadius/5, cloudRadius/7, cloudRadius/7);
    canvas.popMatrix();
  }



  for (int i=0; i<pointsNumber; i++) { 
    pointsCloudCenter.x += random(-cloudRadius/10, cloudRadius/10);
    pointsCloudCenter.y = pointsCloudCenter.y + random(-cloudRadius/10, cloudRadius/10); //paso

    canvas.pushMatrix();
    canvas.translate(pointsCloudCenter.x, pointsCloudCenter.y);
    canvas.noStroke();
    canvas.fill(255, 255, 255);
    canvas.ellipse(0, 0, 5, 5);
    canvas.popMatrix();
  }



  //-----Closes PGraphics-----\\
  canvas.endDraw();
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  canvas.save("makerbot.tif");
}
//-----ResizeRatio for PGraphics-----\\
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  if 
    (ratioWidth < ratioHeight)  ratio = ratioWidth;
else                          
ratio = ratioHeight;
}

