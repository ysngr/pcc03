/* 326_20220204 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(245);
  final float mind = 40, maxd = 520;
  float x, y;
  for ( int i = 0; i < 14; i++ ) {
    x = random(width);
    y = random(height);
    for ( int j = 0; j < 20; j++ ) {
      growingRotDotEllipse(x, y, random(mind, maxd), random(mind, maxd));
    }
  }
}

void growingRotDotEllipse(float x, float y, float da, float db) {
  final color[] cs = {
    color(245,  40, 118), 
    color(234,  85,  75), 
    color( 82, 177, 187), 
    color(251, 203, 103), 
    color(175,  98, 154), 
    color(192, 184, 95), 
    color(159, 192, 141), 
    color(179, 120,  85), 
    color(150, 205, 196)
  };
  final float dt = PI / random(128, 256);
  float sw = random(2);
  float dsw = random(0.4);

  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  stroke(cs[int(random(cs.length))], random(20, 40));
  for ( float t = 0; t < TWO_PI; t += dt ) {
    strokeWeight(sw);
    point(da/2*cos(t), db/2*sin(t));
    sw += dsw;
    if ( random(50) < 1 ) {
      dsw = -dsw;
    }
    if ( sw + dsw <= 0 ) {
      dsw = abs(dsw);
    }
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("326.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
