/* 301_20210424 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(33, 22, 10);
  for ( int i = 0; i < 200; i++ ) {
    shearedRing(random(width), random(height), random(20, 200), random(20, 200));
  }
  for ( float r = 0, t = 0; r < 360; r += 0.5, t += PI / 64 ) {
    shearedRing(width/2+r*cos(t), height/2+r*sin(t), random(20, 80), random(20, 80));
  }
}


void shearedRing(float cx, float cy, float wd, float hd) {

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
  final float dt = PI / 128;

  float wr, hr;

  pushMatrix();
  translate(cx, cy);

  noStroke();
  fill(cs[(int)random(cs.length)], random(128, 255));

  shearX(random(TWO_PI));
  shearY(random(TWO_PI));

  wr = random(0.4, 0.9);
  hr = random(0.7, 0.9);

  beginShape();
  for ( float t = 0; t < TWO_PI; t += dt ) {
    vertex(wd/2*cos(t), hd/2*sin(t));
  }
  beginContour();
  for ( float t = TWO_PI; t > 0; t -= dt ) {
    vertex(wr*wd/2*cos(t), hr*hd/2*sin(t));
  }
  endContour();
  endShape(CLOSE);

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("301.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
