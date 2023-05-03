/* 356_20230503 */

PVector[] ps;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  initPoints();
  for ( int i = 0; i < 64; i++ ) {
    drawNetwork();
    updateNetwork();
  }
}

void initPoints() {
  ps = new PVector[64];
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(random(width), random(height));
  }
}

void drawNetwork() {
  final color[] cs = {
    color( 39,  43,  87),
    color( 38,  55, 130),
    color( 84, 122, 170),
    color(200, 211, 221),
    color( 79,  94, 117),
    color( 45,  44,  45),
    color(233,  77,  71),
    color(237, 111,   0),
    color(251, 203, 114)
  };
  for ( int i = 0; i < ps.length; i++ ) {
    stroke(cs[int(random(cs.length))], 32);
    for ( int j = i + 1; j < ps.length; j++ ) {
      if ( dist(ps[i].x, ps[i].y, ps[j].x, ps[j].y) < 280 ) {
        line(ps[i].x, ps[i].y, ps[j].x, ps[j].y);
      }
    }
  }
}

void updateNetwork() {
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i].x += 4*cos(12*noise(4*ps[i].x/width));
    ps[i].y += 4*sin(12*noise(4*ps[i].y/height));
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("356.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
