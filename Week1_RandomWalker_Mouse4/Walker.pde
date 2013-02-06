class Walker {
  int x, y;
  float px, py;
  Walker() {
    x=width/2;
    y=height/2;

    px=width/0.25;
    py=width/0.25;
  }



  void render() {
    stroke(1);
    ellipseMode(CENTER);   
    ellipse(x, y, 10, 10);
  }


  void step() {

    int choice = int(random(4));

    if (choice == 0) {
      x++;
      fill(20);
    } 
    else if (choice == 1) {
      x--;
      fill(100);
    } 
    else if (choice == 2) {
      y++;
      fill(50);
    } 
    else {
      y = mouseY;
      x = mouseX;
      fill(10);
    }

    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}

