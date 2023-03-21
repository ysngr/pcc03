/* 354_20230321 */

final color[] cs = {
  color(218,  65,  72),
  color(208,  15,  49),
  color(165,  26,  41),
  color( 68,  81,  54),
  color(255, 240, 193),
  color(240, 208, 129),
  color(231, 168,  73)
};

void setup() {
  size(1150, 800);
  blendMode(SCREEN);
  noLoop();
}

void draw() {
  background(30);
  for ( int i = 0; i < 16; i++ ) {
    halo(random(width), random(height), random(80, 720));
  }
  for ( int i = 0; i < 32; i++ ) {
    smoke(random(width), random(height));
  }
}

void halo(float x, float y, float d) {
  float dw, dh;
  pushMatrix();
  translate(x, y);
  noFill();
  for ( int i = 0; i < 120; i++ ) {
    strokeWeight(random(2.0));
    stroke(cs[int(random(cs.length))], random(80, 160));
    dw = random(0.6, 0.8);
    dh = random(0.2, 0.4);
    beginShape();
    for ( float t = 0; t < TWO_PI; t+= random(PI/16) ) {
      vertex(d*dw*cos(t), d*dh*sin(t));
      if ( random(10) < 3 ) {
        line(d*dw*cos(t)+random(-2, 2), d*dh*sin(t)-d*random(0.05, 0.1),
             d*dw*cos(t)+random(-2, 2), d*dh*sin(t)+d*random(0.05, 0.1));
      }
    }
    endShape(CLOSE);
  }
  popMatrix();
}

void smoke(float x, float y) {
  float cx = x, cy = y;
  float dx, dy;
  strokeWeight(1);
  stroke(cs[int(random(cs.length))], 100);
  for ( int i = 0; i < 20000; i++ ) {
    dx = random(-3, 3);
    dy = random(-3, 3);
    line(cx, cy, cx+dx, cy+dy);
    cx += dx;
    cy += dy;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("354.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
