/* 314_20211025 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 320; i++ ) {
    beziers(( random(10) < 9 )? true : false);
  }
}


void beziers(boolean isrt) {

  if ( isrt ) {
    float sr, er, st, et;
    sr = random(width/3);
    er = random(width/3);
    st = random(-PI, PI);
    et = random(-PI, PI);
    pushMatrix();
    translate(width/2, height/2);
    beziers(sr*cos(st), er*sin(st), er*cos(et), er*sin(et));
    popMatrix();
  } else {
    beziers(random(width), random(height), random(width), random(height));
  }

  return ;
}
void beziers(float sx, float sy, float ex, float ey) {

  final color[] cs = {
    color(205, 223, 233), 
    color(159, 192, 207), 
    color(136, 160, 203), 
    color(244, 241, 245), 
    color(254, 236, 204), 
    color(252, 227, 205), 
    color(217, 113, 105), 
    color(198,  83,  78)
  };
  final float D = 10;

  int n = (int)random(25);
  float cx, cy, dx, dy, minx, miny, maxx, maxy;

  strokeWeight(random(2, 5));
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
    stroke(cs[(int)random(cs.length)], random(180, 240));
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    sx += D * random(-1, 1);
    sy += D * random(-1, 1);
    ex += D * random(-1, 1);
    ey += D * random(-1, 1);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("314.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
