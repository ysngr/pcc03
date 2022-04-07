/* 335_20220407 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for ( int i = 0; i < 100; i++ ) {
    float sr = random(360);
    float er = random(360);
    float st = random(-PI, PI);
    float et = random(-PI, PI);
    tube(sr*cos(st), sr*sin(st), er*cos(et), er*sin(et), random(20, 60));
  }
}

void tube(float sx, float sy, float ex, float ey, float d) {
  final color[] cs = {
    color(245,  40, 118), 
    color(234,  85,  75), 
    color( 82, 177, 187), 
    color(251, 203, 103), 
    color(175,  98, 154), 
    color(192, 184,  95), 
    color(159, 192, 141), 
    color(179, 120,  85), 
    color(150, 205, 196)
  };
  final float D = 1.8 * d;
  float x = sx;
  float y = sy;
  float dx = (ex - sx) / dist(sx, sy, ex, ey);
  float dy = (ey - sy) / dist(sx, sy, ex, ey);
  stroke(cs[int(random(cs.length))], 20);
  noFill();
  while ( ! isnear(x, y, ex, ey) ) {
    circle(x, y, d+D*(noise(2*x/width, 2*y/height)-0.5));
    x += dx;
    y += dy;
  }
}

boolean isnear(float x1, float y1, float x2, float y2) {
  final float e = 1;
  return dist(x1, y1, x2, y2) < e;
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("335.png");
    exit();
  } else if ( key == 'r' ) {
    noiseSeed(int(random(1024)));
    redraw();
  }
}
