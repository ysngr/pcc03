/* 358_20230514 */

void setup() {
  size(1150, 800);
  blendMode(ADD);
  noLoop();
}

void draw() {
  background(80, 10, 80);
  for ( int i = 0; i < 64; i++ ) {
    triflower(random(width), random(height), random(80, 140));
  }
  for ( int i = 0; i < 32; i++ ) {
    decircles(random(width), random(height), random(240, 360));
  }
}

void triflower(float x, float y, float r) {
  final float dt = TWO_PI / int(random(16, 32));
  float odt;
  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  noStroke();
  fill(random(255), random(255), random(255), random(100, 200));
  circle(0, 0, 0.2*r);
  for ( float t = 0; t < TWO_PI; t += dt ) {
    odt = dt / 16;
    triangle(
      0.25*r*cos(t), 0.25*r*sin(t),
      r*cos(t+odt), r*sin(t+odt),
      r*cos(t-odt), r*sin(t-odt)
    );
  }
  popMatrix();
}

void decircles(float x, float y, float diag) {
  final float id = random(0.8, 0.9) * diag;
  final float od = random(1.1, 1.2) * diag;
  noStroke();
  fill(random(64, 255), random(30, 120), random(200, 255), 2);
  for ( float d = id; d < od; d++ ) {
    circle(x, y, d);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("358.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
