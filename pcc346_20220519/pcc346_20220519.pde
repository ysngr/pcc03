/* 346_20220519 */

void setup() {
  size(1150, 800);
  rectMode(CENTER);
  noLoop();
}

void draw() {
  background(240);

  strokeWeight(3.2);
  stroke(240);
  fill(198, 14, 143, 120);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/4);
  dsquare(0, 0, height);
  popMatrix();

  final float L = 10;
  float s, ds, l, t;
  s = random(32);
  ds = random(0.01);
  strokeWeight(0.4);
  stroke(240);
  for ( float h = 0; h <= height; h += L ) {
    for ( float w = 0; w <= width; w += L ) {
      l = L * map(noise(12*w/width, 8*h/height, s), 0, 1, 0.2, 2.0);
      t = TWO_PI * noise(10*w/width, 10*h/height, s);
      fill(
        255 * map(noise(w/width, 10*h/height), 0, 1, 0.4, 1.0),
        50 * noise(10*w/width, h/height),
        random(100, 200)
      );
      pushMatrix();
      translate(w, h);
      rotate(t);
      dsquare(0, 0, l);
      popMatrix();
      s += ds;
    }
  }
}

void dsquare(float x, float y, float l) {
  for ( ; l > 5; l *= random(0.85, 0.95) ) {
    square(x, y, l);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("346.png");
    exit();
  } else if ( key == 'r' ) {
    noiseSeed(int(random(1024)));
    redraw();
  }
}
