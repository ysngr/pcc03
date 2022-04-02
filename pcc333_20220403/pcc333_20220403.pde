/* 333_20220403 */

final float dt = PI / 128;
final float ir = 0.5;

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}

void draw() {
  background(240);
  for ( int i = 0; i < 320; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(-PI, PI));
    crown(0, 0, random(30, 120));
    popMatrix();
  }
}

void crown(float cx, float cy, float w, float h) {
  final color[] cs = {
    color(173, 128, 175),
    color(246, 237,  67),
    color(244, 159,  58),
    color( 78, 191, 213),
    color(232,  68, 126),
    color(182, 212,  88),
    color(250, 250, 245),
    color( 83,  78, 138)
  };
  noStroke();
  fill(cs[int(random(cs.length))], 220);
  base(cx, cy, w, h);
  surface(cx, cy, w, h);
}
void crown(float cx, float cy, float w) {
  final float w2h = 0.25;
  crown(cx, cy, w, w*w2h);
}

void base(float cx, float cy, float w, float h) {
  pushMatrix();
  translate(cx, cy);
  beginShape();
  for ( float t = 0; t < TWO_PI; t += dt ) {
    vertex(w*cos(t), h*sin(t));
  }
  beginContour();
  for ( float t = TWO_PI; t > 0; t -= dt ) {
    vertex(ir*w*cos(t), ir*h*sin(t));
  }
  endContour();
  endShape(CLOSE);
  popMatrix();
}

void surface(float cx, float cy, float w, float h) {
  final int interval = int(random(12, 32));
  final float cr = (1 + ir) / 2;
  noStroke();
  pushMatrix();
  translate(cx, cy);
  for ( float t = -PI; t < PI; t += interval*dt ) {
    rect(cr*w*cos(t), cr*h*sin(t)-h, 0.08*w, 2*h);
    circle(cr*w*cos(t), cr*h*sin(t)-2*h, 0.2*w);
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("333.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
