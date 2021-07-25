/* 309_20210725 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  cdots(7);
  strokeWeight(0.5);
  stroke(0);
  spiral(5*height/6, -0.2);
  spiral(height/8, 0.4);
}


void cdots(int n) {

  noStroke();
  fill(232, 81, 30, 180);
  for ( int i = 0; i < n; i++ ) {
    circle(random(width), random(height), random(40, 240));
  }

  return ;
}


void spiral(float ih, float dh) {

  final float r = 200;
  final float dr = 80;
  final float dt = PI / 128;

  float h = ih;
  float wr;

  for ( float w = -r; w < width+r; w += 0.5 ) {
    for ( float t = 0; t < TWO_PI; t += dt ) {
      wr = r + dr * sin(5*t + 10*w/width);
      point(w+wr*cos(t), h+wr*sin(t));
    }
    h += dh;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("309.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
