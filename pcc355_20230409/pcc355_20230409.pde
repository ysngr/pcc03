/* 355_20230409 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(0);
  noStroke();
  fill(255);
  rect(width/2, 0, width/2, height);
  for ( int i = 0; i < 8; i++ ) {
    fractalCircle(random(width), random(height), random(160, 240), 3);
  }
}

void fractalCircle(float x, float y, float r, float d) {
  final color[] cs = {
    color(218,  65,  72),
    color(208,  15,  49),
    color(165,  26,  41),
    color( 68,  81,  54),
    color( 33,  22,  10),
    color(255, 240, 193),
    color(240, 208, 129),
    color(231, 168,  73)
  };
  if ( d < 0 ) {
    return ;
  }
  int n = int(random(4, 16));
  noStroke();
  fill(cs[int(random(cs.length))], 200);
  circle(x, y, 2*r);
  for ( float t = 0; t < TWO_PI; t += PI/n ) {
    fractalCircle(x+random(r)*cos(t), y+random(r)*sin(t), random(0.2, 0.4)*r, d-1);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("355.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
