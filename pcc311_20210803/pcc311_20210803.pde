/* 311_20210803 */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  initPoints();
  bloom();
}


void initPoints() {

  ps = new PVector[70];

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width)+d(), random(height)+d(), random(40, 400));
  }

  return ;
}


void bloom() {

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

  int n;
  float cx, cy, dx, dy, dcx, dcy, ddx, ddy;

  noFill();

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps.length; j++ ) {
      if ( dist(ps[i].x, ps[i].y, ps[j].x, ps[j].y) > ps[i].z || i == j ) {
        continue;
      }
      cx = dx = (ps[i].x + ps[j].x) / 2;
      cy = dy = (ps[i].y + ps[j].y) / 2;
      cx += d();
      dy += d();
      dx += d();
      dy += d();
      dcx = d(5);
      dcy = d(5);
      ddx = d(5);
      ddy = d(5);
      stroke(cs[(int)random(cs.length)], random(100, 200));
      n = (int)random(10, 50);
      for ( int k = 0; k < n; k++ ) {
        bezier(ps[i].x, ps[i].y, cx, cy, dx, dy, ps[j].x, ps[j].y);
        cx += dcx;
        cy += dcy;
        dx += ddx;
        dy += ddy;
      }
    }
  }

  return ;
}


float d() {
  return 80 * random(-1, 1);
}
float d(float a) {
  return a * random(-1, 1);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("311.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
