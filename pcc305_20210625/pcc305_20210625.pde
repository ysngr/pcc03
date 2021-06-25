/* 305_20210502 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(0);
  for ( int i = 0; i < 200; i++ ) {
    sphereBezier(random(width), random(height), random(80, 320));
  }
}


void sphereBezier(float centerX, float centerY, float initRad) {

  final color[] cs = {
    color(247,   9,   9),
    color(  1,  10,  62),
    color( 48, 214, 151)
  };

  int n = (int)random(100, 500);
  float r, t, sx, sy, cx, cy, dx, dy, ex, ey;

  pushMatrix();
  translate(centerX, centerY);

  r = initRad;
  t = random(-PI, PI);
  sx = r * cos(t);
  sy = r * sin(t);
  ex = r * cos(t+PI);
  ey = r * sin(t+PI);
  cx = random(-1, 1) * initRad + (sx + ex) / 2;
  cy = random(-1, 1) * initRad + (sy + ey) / 2;
  dx = random(-1, 1) * initRad + (sx + ex) / 2;
  dy = random(-1, 1) * initRad + (sy + ey) / 2;

  stroke(cs[(int)random(cs.length)], 20);
  noFill();

  for ( int i = 0; i < n; i++ ) {
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    r += random(-0.5, 1.0);
    t += random(-1, 2) * PI / 1024;
    sx = r * cos(t);
    sy = r * sin(t);
    ex = r * cos(t+PI);
    ey = r * sin(t+PI);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("305.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
