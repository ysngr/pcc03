/* 339_20220503 */

void setup() {
  size(1150, 800);
  blendMode(ADD);
  noiseSeed(8630);
  noLoop();
}

void draw() {
  background(30);
  for ( int i = 0; i < 32; i++ ) {
    cochlea(random(width), random(height), random(20));
  }
}

void cochlea(float x, float y, float d) {
  final color[] cs = {
    color(  0, 132, 168), 
    color( 56, 158, 169), 
    color(247, 244, 240), 
    color( 72, 120, 127), 
    color(158, 181, 210), 
    color(184, 203, 191), 
    color(218,  65,  72),
    color(208,  15,  49),
    color(165,  26,  41),
    color( 68,  81,  54),
  };
  final float dr = random(4);
  final float divr = random(100, 120);
  final float dd = random(4);
  final float divd = random(100, 120);
  float r = random(140, 180);
  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  stroke(cs[int(random(cs.length))], random(4, 12));
  noFill();
  for ( float t = 0; t < 2*TWO_PI; t += PI/320 ) {
    circle(r*cos(t), r*sin(t), d);
    r += dr * (noise(r/divr) - 0.5);
    d += dd * (noise(d/divd) - 0.5);
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("339.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
