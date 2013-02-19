//******Bouncing Ball PVector

PVector location;
PVector velocity;

void setup() {

  size (640, 360, P3D);
  location = new PVector (100, 100, 10);
  velocity = new PVector(5, 5, 4);
}

void draw() {
  background(255);

  //Pelota1
  stroke(1);
  fill(175);
  ellipse(location.x, location.y, location.z, location.z);
  location.add(velocity);
  if ((location.x >= width) || (location.x < 0)) {
    velocity.x = velocity.x * -0.99;
  }
  if ((location.y >= height) || (location.y < 0)) {
    velocity.y = velocity.y * -0.99;
  }
  if ((location.z >= 100) || (location.z < 10)) {
    velocity.z = velocity.z * -0.99;
  }

  //Sombra
  noStroke();
  fill(0, 0, 0, 50);
  ellipse(location.x, location.y, location.z*2, location.z*2);
  smooth();
}

