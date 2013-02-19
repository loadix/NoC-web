// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// modified by Mónica Bate
// Original code: NOC_2_7_attraction_many & NOC_3_07_oscillating_objects (File-->Examples-->Books-->Nature_of_Code

// Oscillators are the ellipses attached to the line that move around the Mover

class Oscillator {   

  PVector angle;
  PVector velocity;
  PVector amplitude;

  Oscillator() {   
    angle = new PVector();
    velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    amplitude = new PVector(random(20, width/2), random(20, height/2));
  }   

  void oscillate() {
    angle.add(velocity);
  }   

  void display(PVector location) {   

    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(location.x, location.y);
    stroke(255);
    strokeWeight(1);
    fill(0);
    line(0, 0, x, y);  
    ellipse(x, y, 10, 10);  
    popMatrix();
  }
}   


