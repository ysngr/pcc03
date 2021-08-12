/* 312_20210812 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(0);
  backsmoke(60);
  dcircle(10);
  backsmoke(20);
}


void backsmoke(int n) {

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
  final float a = 4.0;

  int pn;
  float x, y;

  for ( int i = 0; i < n; i++ ) {
    stroke(cs[(int)random(cs.length)]);
    pn = (int)random(1000, 10000);
    x = random(width);
    y = random(height);
    for ( int j = 0; j < pn; j++ ) {
      point(x, y);
      x += a * random(-1, 1);
      y += a * random(-1, 1);
    }
  }

  return ;
}


void dcircle(int n) {

  final float dr = 1;

  float x, y, r;
  int cn;

  stroke(255, 50);
  fill(0, 5);

  for ( int i = 0; i < n; i++ ) {
    x = random(width);
    y = random(height);
    r = random(120, 240);
    cn = (int)random(50, 100);
    for ( int j = 0; j < cn; j++ ) {
      circle(x, y, r);
      r += dr;
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("312.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
