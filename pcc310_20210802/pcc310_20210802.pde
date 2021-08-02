/* 310_20210802 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);

  int n;
  float r;

  for ( int i = 0; i < 10; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    n = (int)random(100, 500);
    for ( int j = 0; j < n; j++ ) {
      r = random(40, 200);
      rotate(random(-PI, PI));
      lines(r, random(10, 120), PI/random(8, 16));
    }
    popMatrix();
    cdots();
    orbit(random(width), random(height), 1000, 1000);
  }
}


void lines(float r, float l, float dt) {

  final float ddt = PI / 256;
  final color[] cs = {
    color( 52, 114, 161), 
    color(  9,  86, 140), 
    color(250, 248, 240), 
    color(205, 218, 219), 
    color(201, 194, 189), 
    color(158, 153, 130), 
    color(141, 156, 160), 
    color(161, 168, 174)
  };

  float d = random(0.2) * l;

  strokeWeight(random(0.8, 1.5));
  stroke(cs[(int)random(cs.length)], random(120, 240));

  for ( float t = 0; t < dt; t += ddt ) {
    line(r-random(d), random(-d, d), r+l+random(d), random(-d, d));
    rotate(random(ddt));
  }

  return ;
}


void cdots() {

  noStroke();
  fill(227, 84, 27, random(40, 200));

  for ( int i = 0; i < 9; i++ ) {
    circle(random(width), random(height), random(20, 60));
  }

  return ;
}



void orbit(float x, float y, float w, float h) {

  final color[] cs = {
    color(227, 236, 244), 
    color(112, 148, 192), 
    color( 56,  90, 158), 
    color( 51,  49, 115), 
    color(232, 211, 207), 
    color(204, 104, 117), 
  };

  float dx, dy, dw, dh;

  strokeWeight(random(2, 4));
  stroke(cs[(int)random(cs.length)], random(180, 240));
  noFill();

  dx = 4 * random(-1, 1);
  dy = 4 * random(-1, 1);
  dw = 12 * random(-1, 1);
  dh = 12 * random(-1, 1);

  for ( int i = 0; i < 6; i++ ) {
    ellipse(x, y, w, h);
    x += dx;
    y += dy;
    w += dw;
    h += dh;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("310.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
