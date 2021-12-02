/* 315_20211203 */

final color[] cs = {
  color(218,  65,  72), 
  color(208,  15,  49), 
  color(165,  26,  41), 
  color( 68,  81,  54), 
  color( 33,  22,  10), 
  color(255, 240, 193), 
  color(240, 208, 129), 
  color(231, 168,  73), 
  color( 33,  22,  10)
};


void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(0);

  PVector[] sps = initArcs(100, 40, 160);
  PVector[] lps = initArcs(16, 320, 480); 

  blendMode(SCREEN);
  for ( int i = 0; i < 180; i++ ) {
    drawArcs(sps);
    drawArcs(lps);
  }

  blendMode(ADD);
  for ( int i = 0; i < 18; i++ ) {
    orbit(random(width), random(height), 1200, 1200);
  }
}


PVector[] initArcs(int n, float sr, float lr) {

  PVector[] ps = new PVector[n];

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height), random(sr, lr));
  }

  return ps;
}


void drawArcs(PVector[] ps) {

  noFill();

  for ( int i = 0; i < ps.length; i++ ) {
    strokeWeight(random(0.5, 2.0));
    stroke(cs[(int)random(cs.length)], 200);
    pushMatrix();
    translate(ps[i].x, ps[i].y);
    rotate(random(-PI, PI));
    arc(0, 0, random(ps[i].z), random(ps[i].z), random(-PI, PI), random(-PI, PI));
    popMatrix();
  }

  return ;
}


void orbit(float x, float y, float w, float h) {

  float dx, dy, dw, dh;

  strokeWeight(random(1, 3));
  stroke(cs[(int)random(cs.length)], 240);
  noFill();

  dx = 4 * random(-1, 1);
  dy = 4 * random(-1, 1);
  dw = 12 * random(-1, 1);
  dh = 12 * random(-1, 1);

  for ( int i = 0; i < 6; i++ ) {
    ellipse(x, y, w, h);
    x += dx;
    y += dy;
    w += dw;
    h += dh;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("315.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
