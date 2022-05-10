/* 343_20220510 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(230, 229, 215);
  for ( int i = 0; i < 48; i++ ) {
    dcircle(random(width), random(height), random(180, 320));
  }
}

void dcircle(float x, float y, float d) {
  final color[] cs = {
    color(  0, 165, 213),
    color( 89, 195, 225),
    color(161, 216, 225),
    color( 76, 187, 180),
    color(134, 202, 182),
    color( 91, 164, 105),
    color(250, 238, 222),
    color(247, 242, 244)
  };

  color c = cs[int(random(cs.length))];
  float r = d / 2;
  noStroke();
  for ( float a = random(10, 20); a > 0; a -= 0.25 ) {
    fill(c, a);
    circle(x, y, 2*r);
    r += 0.50;
  }

  c = cs[int(random(cs.length))];
  r = 0;
  noFill();
  for ( float a = random(140, 160); a > 0; a -= 0.3 ) {
    stroke(c, a);
    circle(x, y, 2*r);
    r += 0.75;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("343.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
