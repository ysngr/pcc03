/* 320_20211231 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 60; i++ ) {
    beziers();
  }
}


void beziers() {

  final color[] cs = {
    color(163, 214, 206), 
    color(100, 187, 186), 
    color( 63, 171, 155), 
    color(133, 203, 191), 
    color(165, 213, 183), 
    color( 89, 188, 157), 
    color(100, 157, 112), 
    color( 48, 128, 152), 
    color( 74, 172, 188), 
    color(234,  77,  21), 
    color(214,  85,  11)
  };

  int n;
  float sx, sy, cx, cy, dx, dy, ex, ey;

  n = (int)random(400, 1400);
  sx = random(width);
  sy = random(height);
  cx = random(width);
  cy = random(height);  
  dx = random(width);
  dy = random(height);
  ex = random(width);
  ey = random(height);

  stroke(cs[(int)random(cs.length)], 40);
  noFill();

  for ( int i = 0; i < n; i++ ) {
    bezier(sx, sy, cx, cy, dx, dy, ex, ey);
    sx += d();
    sy += d();
    cx += d();
    cy += d();
    dx += d();
    dy += d();
    ex += d();
    ey += d();
  }

  return ;
}


float d() {
  return 2.5 * random(-1, 1);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("320.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
