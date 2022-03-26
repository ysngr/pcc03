/* 331_20220326 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  cdots(12);
  spiral(height/5, random(1.5), random(40, 80));
  spiral(height/2, random(1.5), random(40, 80));
  spiral(4*height/5, random(1.5), random(40, 80));
}

void cdots(int n) {
  noStroke();
  fill(255, 77, 20, 100);
  for ( int i = 0; i < n; i++ ) {
    circle(random(width), random(height), random(40, 120));
  }
}

void spiral(float ih, float p, float q) {
  final float r = 80;
  final float dr = 40;
  final float dt = PI / 128;
  float h = ih;
  float wr;
  strokeWeight(0.35);
  stroke(0);
  for ( float w = -r; w < width+r; w += 0.6 ) {
    for ( float t = 0; t < TWO_PI; t += dt ) {
      wr = r + dr * sin(p*t + q*w/width);
      point(w+wr*cos(t), h+wr*sin(t));
    }
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("331.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
