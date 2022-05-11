/* 344_20220511 */

void setup() {
  size(1150, 800);
  blendMode(ADD);
  noLoop();
}

void draw() {
  background(0);
  for ( int i = 0; i < 1600; i++ ) {
    hexagon(random(width), random(height), random(5, 55));
  }
}

void hexagon(float x, float y, float l) {
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
  final float dt = TWO_PI / 6;
  float r = l;
  noStroke();
  fill(cs[int(random(cs.length))], random(4, 7));
  for ( int i = 0; i < 10; i++ ) {
    beginShape();
    for ( int j = 0; j < 6; j++ ) {
      vertex(x+r*cos(j*dt), y+r*sin(j*dt));
    }
    endShape(CLOSE);
    r++;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("344.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
