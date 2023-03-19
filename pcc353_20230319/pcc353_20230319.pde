/* 353_20230319 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 50; i++ ) {
    scatterWalk(random(width), random(height), random(5000, 10000));
  }
  for ( int i = 0; i < 50; i++ ) {
    scatterSquare(random(width), random(height), random(100, 150));
  }
  for ( int i = 0; i < 50; i++ ) {
    scatterDots(random(width), random(height), random(10, 50));
  }
}

void scatterWalk(float x, float y, float n) {
  final color[] cs = {
    color(159,  33,  88),
    color(120,  34,  85),
    color(165, 132, 144),
    color(236, 209, 191),
    color(187,  85,  72),
    color(  0, 125, 142),
    color( 75,  26,  71),
    color(220, 211, 176)
  };
  float cx = x;
  float cy = y;
  float dx, dy;
  stroke(cs[int(random(cs.length))], 200);
  for ( int i = 0; i < n; i++ ) {
    dx = random(-5, 5);
    dy = random(-5, 5);
    line(cx, cy, cx+dx, cy+dy);
    cx += dx;
    cy += dy;
  }
}

void scatterSquare(float x, float y, float l) {
  final color[] cs = {
    color(157, 170, 189),
    color(162, 190, 202),
    color(192, 184, 176),
    color( 76,  91, 102),
    color(185, 139, 105),
    color( 85,  63,  43),
    color(211, 215, 217),
    color(111, 131, 150),
    color(103, 103, 130),
    color(183, 178, 204),
    color(189, 155, 183),
    color(110,  93, 136)
  };
  int n = int(random(50, 100));
  PGraphics p = createGraphics(int(l), int(l));
  p.beginDraw();
  p.translate(l/2, l/2);
  p.rotate(random(-PI, PI));
  p.noStroke();
  p.fill(cs[int(random(cs.length))]);
  for ( int i = 0; i < n; i++ ) {
    if ( i % 2 == 0 ) {
      p.rect(-l, -l/2+i*l/n, 2*l, l/n);
    }
  }
  p.endDraw();
  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  image(p, 0, 0);
  popMatrix();
}

void scatterDots(float x, float y, float d) {
  noStroke();
  fill(random(220, 255), random(100, 120), random(0, 30), random(100, 200));
  circle(x, y, d);
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("353.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
