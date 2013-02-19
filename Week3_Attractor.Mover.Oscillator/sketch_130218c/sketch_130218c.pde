// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// modified by Mónica Bate
// Original code: NOC_2_7_attraction_many & NOC_3_07_oscillating_objects (File-->Examples-->Books-->Nature_of_Code


// An array of objects
Oscillator[] oscillators = new Oscillator[6];
Mover [] movers = new Mover[6];
Attractor a;

//**************************
void setup() {   
  size(800, 800);  
  smooth();  

  // Initialize all objects oscillators
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }

  // Initialize all objects oscillators
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }

  a = new Attractor();
}   


//***************************
void draw() {     
  background(0);  

  // Run all objects
  a.display();

  for (int i = 0; i<movers.length; i++) {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].applyForce(force); //add Ricky
    movers[i].update();
    movers[i].display();

    for (int j = 0; j < oscillators.length; j++) {
      oscillators[j].display(movers[i].location);
    }
    
  }
  
  for (int j = 0; j < oscillators.length; j++) {
      oscillators[j].oscillate();
    }
}   

