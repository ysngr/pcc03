/* 317_20211210 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(40);
  decircles(40);
}


void decircles(int n) {

  final color[] cs = {
    color(160, 216, 239), 
    color(250, 250, 245), 
    color( 25, 115, 191), 
    color( 87, 116, 216), 
    color( 13, 102, 222), 
  };

  float x, y, d;

  noStroke();
  for ( int i = 0; i < n; i++ ) {
    x = random(width);
    y = random(height);
    d = random(120, 260);
    fill(cs[(int)random(cs.length)], 3);
    for ( float r = d; r > 0.4*d; r -= random(0.5, 1.2) ) {
      circle(x+random(-1, 1), y+random(-1, 1), 2*r);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("317.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
