Walker w;

void setup(){
size(800, 800);
w=new Walker();
background(20, 100, 100);
}

void draw(){
w.step();
w.render();
}


