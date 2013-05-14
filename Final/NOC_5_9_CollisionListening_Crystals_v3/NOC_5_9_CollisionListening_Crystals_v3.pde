import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import ddf.minim.*; // michrophone


// A reference to our box2d world
PBox2D box2d;

Box box;

// An ArrayList of particles that will fall on the surface
ArrayList<Particle> particles;
ArrayList<Boundary> walls;

Minim minim; //Sound library
AudioInput blow; //AudioPlayer blow;

void setup() {
  size(500, 700);
  // Initialize box2d physics and create the world
  box2d = new PBox2D(this);
  box2d.createWorld();

  minim = new Minim(this); //initialize library for sound
  blow = minim.getLineIn(Minim.STEREO); 

  // Turn on collision listening!
  box2d.listenForCollisions();

  // Make the box
  box = new Box(width/2, height/2);

  // Create the empty list
  particles = new ArrayList<Particle>();
  walls = new ArrayList<Boundary>();

  Boundary wall = new Boundary(width/2, height-5, width, 10);
  Boundary wall_2 = new Boundary(-5, height/2, 10, height);
  Boundary wall_3 = new Boundary(width, height/2, 10, height);
  walls.add(wall);
  walls.add(wall_2);
  walls.add(wall_3);
  //wall = new Boundary(0, height-, width, 10);
}

void draw() {
  background(0);

  //graduated glass
  int a = 30;
  stroke(255);
  strokeWeight(0.5);
  line(50, 50, 50, height-50);//vertical
  line(a, 50, (a+40), 50);
  line(a, 150, (a+40), 150);
  line(a, 250, (a+40), 250);
  line(a, 350, (a+40), 350);
  line(a, 450, (a+40), 450);
  line(a, 550, (a+40), 550);
  line(a, 650, (a+40), 650);

  if (random(1) < 0.1 && particles.size()<100) {
    float sz = random(30, 50);
    particles.add(new Particle(random(width), 20, sz));
  }

  // We must always step through time!
  box2d.step();

  // if (mousePressed) {
  if (blow.mix.level() > 0.05) {
    box.setLocation(random(0,width), random(height*3/4,height));
  } 
  else {
    //box.setLocation(x,y);
  }

  // Look at all particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p.done()) {
      particles.remove(i);
    }
  }
  for (int i = 0; i < walls.size(); i++) {
    walls.get(i).display();
  }

  // Draw the box
  box.display();
}



// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Particle.class && o2.getClass() == Particle.class) {
    Particle p1 = (Particle) o1;

    Particle p2 = (Particle) o2;
  }

  // If object 1 is a Box, then object 2 must be a particle
  // Note we are ignoring particle on particle collisions
  if (o1.getClass() == Box.class) {
    Particle p = (Particle) o2;
    //p.change();
  } 
  // If object 2 is a Box, then object 1 must be a particle
  else if (o2.getClass() == Box.class) {
    Particle p = (Particle) o1;
    //p.change();
  }
}

// Objects stop touching each other
void endContact(Contact cp) {
}













