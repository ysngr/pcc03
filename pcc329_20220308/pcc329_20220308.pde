/* 329_20220308 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(SCREEN);
}

void draw() {
  background(40);
  for ( int i = 0; i < 20; i++ ) {
    twistellipse(random(width), random(height), random(width), random(height), random(40, 240), random(40, 240));
  }
}

void twistellipse(float sx, float sy, float ex, float ey, float sw, float sh) {
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
  int n = int(mag(ex-sx, ey-sy));
  float dx = (ex - sx) / n;
  float dy = (ey - sy) / n;
  float x = sx;
  float y = sy;
  float w = sw;
  float h = sh;
  float t = random(-PI, PI);
  noiseSeed(int(random(1024)));
  stroke(cs[int(random(cs.length))], random(20, 50));
  noFill();
  for ( int i = 0; i < n; i++ ) {
    pushMatrix();
    translate(x, y);
    rotate(t);
    ellipse(0, 0, w, h);
    x += dx;
    y += dy;
    t += PI/128 * noise(x/width, y/height);
    w += sw/100 * (noise(x/width) - 0.5);
    h += sh/100 * (noise(y/height) - 0.5);
    popMatrix();
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("329.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
