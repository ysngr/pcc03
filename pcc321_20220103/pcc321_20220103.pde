/* 321_20220103 */

void setup() {
  size(1150, 800, P3D);
  blendMode(ADD);
  noLoop();
} 

void draw() {
  background(0);
  for ( int i = 0; i < 30; i++ ) {
    luminous(random(width), random(height), random(60, 240));
  }
  saveFrame("321.png");
}

void luminous(float cx, float cy, float r) {
  final color[] cs = {
    color(218, 205, 139), 
    color(174, 154, 107), 
    color( 92, 118, 100), 
    color(  0, 126, 118), 
    color(248, 246, 222), 
    color(230, 224, 196), 
    color( 85, 125,  62), 
    color( 73,  49,  60), 
    color(235,  92,  50)
  };
  final float dt = PI / 128;
  int n;
  float t, u, st, su, rot;

  n = (int)random(100, 400);
  st = random(-PI, PI);
  su = random(-PI, PI);
  rot = PI / random(64, 1024);

  stroke(cs[(int)random(cs.length)], 80);
  noFill();

  pushMatrix();
  translate(cx, cy);
  for ( int i = 0; i < n; i++ ) {
    rotate(rot);
    rot += 0.00001;
    beginShape();
    for ( t = st, u = su; t < st + TWO_PI; t += dt, u += random(-1, 1)*0.0001 ) {
      vertex(r*cos(t)*cos(u), r*sin(t)*sin(u), r*cos(t));
    }
    endShape();
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 'r' ) {
    redraw();
  }
}
