/* 348_20220523 */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  init(256);
  for ( int i = 0; i < 128; i++ ) {
    net(random(180, 240));
    update();
  }
}

void init(int n) {
  ps = new PVector[n];
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height));
  }
}

void net(float md) {
  stroke(( random(10) < 1 )? color(216, 9, 9, 20) : color(random(40, 100), 10));
  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i+1; j < ps.length; j++ ) {
      if ( dist(ps[i].x, ps[i].y, ps[j].x, ps[j].y) < md ) {
        line(ps[i].x, ps[i].y, ps[j].x, ps[j].y);
      }
    }
  }
}

void update() {
  final float D = 8;
  final float A = 4;
  float x, y, t;
  for ( int i = 0; i < ps.length; i++ ) {
    x = ps[i].x;
    y = ps[i].y;
    t = TWO_PI * noise(D*x/width, D*y/height);
    x += A * cos(t);
    y += A * sin(t);
    ps[i] = new PVector(x, y);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("348.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
