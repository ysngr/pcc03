/* 308_20210724 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  for ( int i = 0; i < 7; i++ ) {
    rectspole(random(width));
  }
}


void rectspole(float w) {

  final color[] cs = {
    color(218,  65,  72), 
    color(208,  15,  49), 
    color(165,  26,  41), 
    color( 79,  53,  39), 
    color( 68,  81,  54), 
    color(255, 240, 193), 
    color(231, 168,  73)
  };

  float dw, dh, r, dt, rw, rh;

  dw = random(-1, 1) * 10;
  for ( float h = 0; h < height; h += dh ) {
    pushMatrix();
    translate(w, 0);
    fill(cs[(int)random(cs.length)], random(80, 240));
    r = random(5, 120);
    dt = PI / random(5, 20);
    rh = random(10, 40);
    rw = random(10, 40);
    for ( float t = 0; t < TWO_PI; t += dt ) {
      rect(r*cos(t), h+r*sin(t), rw, rh);
    }
    w += dw;
    dh = min(rw, rh);
    popMatrix();
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("308.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
