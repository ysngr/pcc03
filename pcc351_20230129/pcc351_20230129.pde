/* 251_20230129 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 24; i++ ) {
    bezierPolygon(random(width), random(height), random(80, 240), int(random(3, 8)));
  }
  for ( int i = 0; i < 32; i++ ) {
    cdot(random(width), random(height), random(8, 24));
  }
}

void bezierPolygon(float x, float y, float l, int p) {
  final color[] cs = {
    color(185, 188, 176),
    color(230, 230, 230),
    color(201, 202, 202),
    color(159, 160, 160),
    color( 89,  87,  87),
    color( 54,  82, 110),
    color( 53, 108, 156),
    color( 66, 123, 191)
  };
  final float dt = TWO_PI / p;
  float c1x, c1y, c2x, c2y;
  float dx = random(-1, 1);
  float dy = random(-1, 1);
  int n = int(random(64, 128));
  color cb = cs[int(random(cs.length))];
  color cl = cs[int(random(cs.length))];
  noFill();
  for ( int i = 0; i < n; i++ ) {
    for ( float t = 0; t < TWO_PI; t += dt ) {
      c1x = (x+l*cos(t) + x+l*cos(t+dt)) / 3 + i * dx;
      c1y = (y+l*sin(t) + y+l*sin(t+dt)) / 3 + i * dy;
      c2x = 2 * (x+l*cos(t) + x+l*cos(t+dt)) / 3 + i * dx;
      c2y = 2 * (y+l*sin(t) + y+l*sin(t+dt)) / 3 + i * dy;
      stroke(cb, random(80, 160));
      bezier(
        x+l*cos(t), y+l*sin(t),
        c1x, c1y,
        c2x, c2y,
        x+l*cos(t+dt), y+l*sin(t+dt)
      );
      stroke(cl, random(80, 160));
      line(x+l*cos(t)+i*dx, y+l*sin(t)+i*dy, x+l*cos(t+dt)+i*dx, y+l*sin(t+dt)+i*dy);
    }
  }
}

void cdot(float x, float y, float r) {
  noStroke();
  fill(random(220, 255), random(60, 100), random(10, 30), random(180, 240));
  circle(x, y, 2*r);
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("351.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
