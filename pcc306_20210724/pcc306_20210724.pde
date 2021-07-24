/* 306_20210724 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(22, 33, 44);
  for ( int i = 0; i < 100; i++ ) {
    explines(random(width), random(height), random(80, 240));
  }
}


void explines(float cx, float cy, float il) {

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 68,  81,  54), 
    color(255, 240, 193), 
    color(240, 208, 129), 
    color(231, 168,  73)
  };

  int n = (int)random(200, 800);
  float dt = PI / random(128, 1024);
  float dl = random(0.1, 0.2) * il;
  float l = il;

  pushMatrix();
  translate(cx, cy);
  rotate(random(-PI, PI));
  stroke(cs[(int)random(cs.length)], random(15, 30));

  for ( int i = 0; i < n; i++ ) {
    line(-l/2, 0, l/2, 0);
    if ( random(2) < 1 ) {
      translate(random(-1, 1), random(-1, 1));
    }
    rotate(dt);
    l += random(-1, 1) * dl;
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("306.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
