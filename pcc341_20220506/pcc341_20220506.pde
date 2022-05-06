/* 341_20220506 */

final color[] cs = {
  color(218,  65,  72),
  color(208,  15,  49),
  color(165,  26,  41),
  color( 68,  81,  54),
  color( 33,  22,  10),
  color(255, 240, 193),
  color(240, 108, 129),
  color(231, 168,  73)
};

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  init(48);
  graph();
}

void init(int n) {
  ps = new PVector[n];
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height), random(160, 280));
  }
}

void graph() {
  final float MAXD = 360;
  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < i; j++ ) {
      if ( dist(ps[i].x, ps[i].y, ps[j].x, ps[j].y) < MAXD ) {
        dbezier(ps[i].x, ps[i].y, ps[j].x, ps[j].y);
      }
    }
    decircle(ps[i].x, ps[i].y, ps[i].z);
  }
}

void dbezier(float sx, float sy, float ex, float ey) {
  float cx, cy, dx, dy, dcx, dcy, ddx, ddy;
  cx = dx = (sx + ex) / 2;
  cy = dy = (sy + ey) / 2;
  cx += d(80);
  dy += d(80);
  dx += d(80);
  dy += d(80);
  dcx = d(10);
  dcy = d(10);
  ddx = d(10);
  ddy = d(10);
  stroke(cs[(int)random(cs.length)], random(100, 200));
  noFill();
  for ( int i = 0; i < 20; i++ ) {
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    cx += dcx;
    cy += dcy;
    dx += ddx;
    dy += ddy;
  }
}

float d(float a) {
  return a * random(-1, 1);
}

void decircle(float x, float y, float d) {
  final float D = 2.0;
  color c = cs[int(random(cs.length))];
  noStroke();
  for ( float a = random(10, 20); a > 0; a -= 0.25 ) {
    fill(c, a);
    circle(x+D*random(-1, 1), y+D*random(-1, 1), d);
    d += 1.5;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("341.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
