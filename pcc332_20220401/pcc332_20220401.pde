/* 332_20220401 */

final float MIND = 200;
final float MAXD = 600;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 24; i++ ) {
    circles(random(width), random(height), random(MIND, MAXD));
  }
}

void circles(float x, float y, float d) {
  final color[] cs = {
    color(149, 155, 169),
    color( 94, 101, 102),
    color(211, 210, 191),
    color( 36,  49,  70),
    color( 62,  49,  70),
    color( 62,  87, 112),
    color(217, 117,  86),
    color(241, 173,  95),
    color(225, 198, 192),
    color(224, 140, 122)
  };
  final int n = int(map(d, MIND, MAXD, 8, 32));
  float r, t, cx, cy, cr, dcr;
  stroke(cs[int(random(cs.length))], 48);
  noFill();
  circle(x, y, d);
  for ( int i = 0; i < n; i++ ) {
    r = random(d/32, d/2);
    t = random(-PI, PI);
    cx = x + r * cos(t);
    cy = y + r * sin(t);
    dcr = random(2, 16);
    strokeWeight(random(0.8, 2.4));
    for ( cr = d/2-r; cr > 0; cr -= dcr ) {
      circle(cx, cy, 2*cr);
    }
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("332.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
