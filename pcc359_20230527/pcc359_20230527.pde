/* 359_20230527 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 24; i++ ) {
    flow();
  }
}

void flow() {
  final color[] cs = {
    color(218, 205, 139),
    color(174, 154, 107),
    color( 92, 118, 100),
    color(  0, 126, 118),
    color(248, 246, 222),
    color(230, 224, 196),
    color( 85, 125,  62),
    color( 73,  49,  60),
    color(235,  92,  50)
  };
  noiseSeed(int(random(1024)));
  strokeWeight(random(1.5, 2.0));
  stroke(cs[int(random(cs.length))]);
  for ( int i = 0; i < 128; i++ ) {
    int n = int(random(800, 1200));
    float x = random(width);
    float y = random(height);
    float t;
    for ( int j = 0; j < n; j++ ) {
      t = 64 * noise(x/width, y/height);
      x += cos(t);
      y += sin(t);
      point(x, y);
    }
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("359.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
