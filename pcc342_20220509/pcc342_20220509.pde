/* 342_20220509 */

final color sc = color(188, 242, 255);
final color ec = color(17, 155, 188);

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  lerpground();
  for ( int i = 0; i < 32; i++ ) {
    beziers(random(width), random(height), random(width), random(height));
  }
}

void lerpground() {
  background(255);
  final float rw = 32;
  final float rh = 2 * rw;
  final float d = 5 * rh;
  final float a = 0.8 * rh;
  final float dt = PI / 14;
  for ( float h = -d; h < height+d; h += rh ) {
    float t = PI / 8;
    for ( float w = 0; w < width+rw; w += rw ) {
      lerprect(w, h+a*cos(t), rw, rh);
      t += dt;
    }
  }
}

void lerprect(float cx, float cy, float w, float h) {
  pushMatrix();
  translate(cx, cy);
  for ( float y = -h/2; y < h/2; y++ ) {
    stroke(lerpColor(sc, ec, (y+h/2)/h), 200);
    line(-w/2, y, w/2, y);
  }
  popMatrix();
}

void beziers(float sx, float sy, float ex, float ey) {
  final float D = 20;
  int n = int(random(50, 200));
  float cx, cy, dx, dy, minx, miny, maxx, maxy;
  color c;
  strokeWeight(random(1, 3));
  noFill();
  minx = min(sx, ex);
  miny = min(sy, ey);
  maxx = max(sx, sy);
  maxy = max(sy, ey);
  cx = random(minx, miny);
  cy = random(maxx, maxy);
  dx = random(minx, maxy);
  dy = random(miny, maxy);
  for ( int i = 0; i < n; i++ ) {
    c = ( random(100) < 3 )? color(255, 50, 69): lerpColor(sc, ec, random(1));
    stroke(c, 220);
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    sx += D * random(-1, 1);
    sy += D * random(-1, 1);
    ex += D * random(-1, 1);
    ey += D * random(-1, 1);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("342.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
