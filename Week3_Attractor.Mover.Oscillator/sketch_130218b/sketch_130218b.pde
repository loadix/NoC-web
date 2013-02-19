// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An array of objects
Oscillator[] oscillators = new Oscillator[6];
Mover mover;
Attractor a;

void setup() {   
  size(800, 800);  
  smooth();  
  // Initialize all objects
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }
  
  mover = new Mover(random(0.1, 2), random(width), random(height));
  a = new Attractor();
  
  background(255);
}   

void draw() {     
  background(255);  
  // Run all objects
  
  a.display();
  a.drag();
  a.hover(mouseX, mouseY);

    PVector force = a.attract(mover);
    mover.applyForce(force);

    mover.update();
    mover.display();
  
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].oscillate();
    oscillators[i].display(mover.location);
  }
}   

