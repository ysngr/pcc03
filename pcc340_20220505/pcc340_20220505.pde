/* 340_20220505 */

PVector c;
PVector[] d;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  init();
  for ( int i = 0; i < 10000; i++ ) {
    plot();
    update();
  }
}

void init() {
  final float R = 180;
  final int DN = 32;
  c = new PVector(width/2, height/2);
  d = new PVector[DN];
  for ( int i = 0; i < d.length; i++ ) {
    d[i] = new PVector(R*cos(i*TWO_PI/DN), R*sin(i*TWO_PI/DN));
  }
}

void plot() {
  final color[] cs = {
    color(227, 236, 244),
    color(112, 148, 192),
    color( 56,  90, 158),
    color(234, 235, 235),
    color(212, 212, 211),
    color( 51,  49, 115),
    color(232, 211, 207),
    color(204, 104, 117),
    color(164, 125,  90)
  };
  stroke(cs[int(random(cs.length))], 140);
  noFill();
  beginShape();
  for ( int i = 0; i < d.length; i++ ) {
    curveVertex(c.x+d[i].x, c.y+d[i].y);
  }
  endShape(CLOSE);
}

void update() {
  final float D = 2.5;
  c.x += D * random(-1, 1);
  c.y += D * random(-1, 1);
  for ( int i = 0; i < d.length; i++ ) {
    d[i].x += D * random(-1, 1);
    d[i].y += D * random(-1, 1);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("340.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
