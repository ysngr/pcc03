/* 322_20220116 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(40);
  for ( int i = 0; i < 20; i++ ) {
    decarc(random(width), random(height), random(200, 500), -1);
  }
}

void decarc(float cx, float cy, float r, int cidx) {
  final color[] cs = {
    color(247,   9,   9), 
    color(  1,  10,  62), 
    color(234, 225,  43), 
    color( 43, 207, 234), 
    color( 14, 196,  94), 
    color(196,  14, 178), 
    color(240, 240, 240),
    color( 14,  94, 196)
  };
  final int PLOTTIME = int(random(120, 240));
  float t = random(-PI, PI);
  float dt = (( random(2) < 1 )? 1 : -1) * PI / random(128, 256);
  float sw = random(1);
  float dsw = random(0.05);

  if ( r < 20 ) {
    return ;
  }

  if ( cidx == -1 ) {
    cidx = int(random(cs.length));
  }
  noStroke();
  fill(cs[cidx]);

  for ( int i = 0; i < PLOTTIME; i++ ) {
    circle(cx+r*cos(t), cy+r*sin(t), sw);
    if ( random(60) < 1 ) {
      decarc(cx+r*cos(t), cy+r*sin(t), random(0.2, 0.8)*r, cidx);
    }
    t += dt;
    sw += dsw;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("322.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
