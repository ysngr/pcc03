/* 347_20220521 */

void setup() {
  size(1150, 800);
  noLoop();
  noiseSeed(729);
}

void draw() {
  background(240);
  for ( int i = 0; i < 1024; i++ ) {
    nlines(random(width), random(1.05*height));
  }
}

void nlines(float x, float y) {
  final color[] cs = {
    color(218, 205, 139),
    color(174, 154, 107),
    color( 92, 118, 100),
    color( 92, 118, 100),
    color(  0, 126, 118),
    color(248, 246, 222),
    color(230, 224, 196),
    color( 85, 125,  62),
    color( 73,  49,  60),
    color(235,  92,  50)
  };
  final float DD = 800, D = 0.5;
  int n;
  float a, dx, dy, divx, divy;
  a = ( random(10) < 1 )? random(120, 240) : random(20, 40);
  stroke(cs[int(random(cs.length))], a);
  n = int(random(100, 800));
  divx = random(500, 1000);
  divy = random(500, 1000);
  for ( int i = 0; i < n; i++ ) {
    dx = DD * (noise(x/divx) - 0.5);
    dy = DD * (noise(y/divy) - 0.5);
    line(x, y, x+dx, y+dy);
    x += D * sin(TWO_PI*noise(x/500));
    y += D * cos(TWO_PI*noise(y/500));
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("347.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
