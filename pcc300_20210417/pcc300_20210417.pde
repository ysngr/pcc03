/* 300_20210417 */

void setup() {
  size(1150, 800);
  noLoop();
  rectMode(CENTER);
}


void draw() {
  background(240);
  for ( int i = 0; i < 5; i++ ) {
    int n = (int)random(80, 320);
    float cx = random(width);
    float cy = random(height);
    for ( int j = 0; j < n; j++ ) {
      orbit(cx, cy, random(60, 400));
    }
  }
}


void orbit(float cx, float cy, float sr) {

  final color[] cs = {
    color(227, 236, 244), 
    color(112, 148, 192), 
    color( 56,  90, 158), 
    color(234, 235, 235), 
    color(212, 212, 211), 
    color( 51,  49, 115), 
    color(232, 211, 207), 
    color(204, 104, 117), 
    color(164, 125,  90)
  };

  int n = (int)random(1, 8);
  float dt = PI / random(128, 1024);
  float rw, rh, t, w, h;

  pushMatrix();
  translate(cx, cy);
  rotate(random(-PI, PI));
  stroke(cs[(int)random(cs.length)], random(80, 120));
  noFill();

  rw = random(0.5, 1.5) * sr;
  rh = random(0.5, 1.5) * sr;
  w = random(20);
  h = random(20);
  for ( t = 0; t < n*TWO_PI; t += dt ) {
    rect(rw*cos(t), rh*sin(t), w, h);
    rw += d(rw);
    rh += d(rh); 
    w += d(w);
    h += d(h);
  }

  popMatrix();

  return ;
}


float d(float s) {
  return random(-1, 1) * s / 8;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("300.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
