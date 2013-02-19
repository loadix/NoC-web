// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// modified by Mónica Bate
// Original code: NOC_2_7_attraction_many & NOC_3_07_oscillating_objects (File-->Examples-->Books-->Nature_of_Code

//Mover is the ellipse that's the origin of the movement of the oscillators

class Mover {
  Oscillator[] oscillators = new Oscillator[6];
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {

    // Initialize all objects oscillators
    for (int i = 0; i < oscillators.length; i++) {
      oscillators[i] = new Oscillator();
    }

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
 
  for (int j = 0; j < oscillators.length; j++) { //copiado desde panel principal
      oscillators[j].oscillate();
    }
  }

  void display() {
    stroke(255);
    strokeWeight(2);
    fill(0, 100);
    ellipse(location.x, location.y, mass*5, mass*5);
    
     for (int j = 0; j < oscillators.length; j++) {
      oscillators[j].display(location);
    }
    
  }
}

