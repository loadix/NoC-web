// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// modified by Mónica Bate
// Original code: NOC_2_7_attraction_many & NOC_3_07_oscillating_objects (File-->Examples-->Books-->Nature_of_Code

//Mover is the ellipse that's the origin of the movement of the oscillators

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(random(width), random(height));
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0); //mult: Multiplies a vector by a scalar or multiplies one vector by another.
  }

  void display() {
    stroke(255);
    strokeWeight(2);
    fill(0,100);
    ellipse(location.x, location.y, mass*5, mass*5);
  }
}

