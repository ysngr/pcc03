/* 345_20220518 */

final float MIND = 60;
final float MAXD = 240;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 320; i++ ) {
    flower(random(width), random(height), random(MIND, MAXD));
  }
}

void flower(float x, float y, float d) {
  final color[] cs = {
    color(216,  65, 145),
    color(214, 139, 185),
    color(235, 109, 154),
    color(251, 230, 239),
    color(174, 128, 126),
    color(193, 216, 128),
    color(150, 200,  85),
    color(145, 164,  78)
  };
  int n;
  color c;
  float r, dt, st;
  
  noStroke();
  n = int(map(d, MIND, MAXD, 15, 100));
  c = cs[int(random(cs.length))];
  dt = random(PI/32, PI/12);
  for ( int i = 0; i < n; i++ ) {
    r = random(d/2);
    st = random(-PI, PI);
    fill(c, random(80, 160));
    arc(x, y, 2*r, 2*r, st, st+dt);
  }
  
  noFill();
  n = int(map(n, MIND, MAXD, 20, 80));
  c = cs[int(random(cs.length))];
  for ( int i = 0; i < n; i++ ) {
    r = random(d/3);
    dt = random(PI/8, PI/2);
    st = random(-PI, PI);
    stroke(c, random(60, 120));
    arc(x, y, 2*r, 2*r, st, st+dt);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("345.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
