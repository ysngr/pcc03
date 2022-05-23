/* 349_20220524 */

void setup() {
  size(1150, 800);
  rectMode(CENTER);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 128; i++ ) {
    waveblock(random(width), random(height), random(80, 320));
  }
}

void waveblock(float cx, float cy, float l) {
  final color[] cs = {
    color(227, 236, 244),
    color(112, 148, 192),
    color( 56, 90, 158),
    color(234, 235, 235),
    color(212, 212, 211),
    color( 51, 49, 115),
    color(232, 211, 207),
    color(204, 104, 117),
    color(164, 125, 90)
  };
  float a, t, dt, x, dx, dy;
  int idx = int(random(5));
  a = l / random(2, 6);
  t = random(-PI, PI);
  dt = PI / random(4, 32);
  dx = random(4, 8);
  pushMatrix();
  translate(cx, cy);
  rotate(random(-PI, PI));
  noStroke();
  fill(cs[int(random(cs.length))], 220);
  square(0, 0, l+10);
  stroke(cs[int(random(cs.length))]);
  fill(cs[int(random(cs.length))]);
  for ( x = -l/2; x < l/2; x += dx ) {
    dy = a * wave(t, idx);
    line(x, dy, x, 0);
    circle(x, dy, 3);
    t += dt;
  }
  popMatrix();
}

float wave(float t, int idx) {
  switch( idx ) {
  case 0:
    return cos(t);
  case 1:
    return sin(t) * cos(t);
  case 2:
    return sin(t) * sin(t);
  case 3:
    return sin(t) * sin(t) * sin(t);
  case 4:
    return sin(t) * cos(tan(t));
  default:
    return sin(t);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("349.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
