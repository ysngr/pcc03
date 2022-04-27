/* 337_20220427 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(DIFFERENCE);
  rectMode(CENTER);
}

void draw() {
  background(240);
  pushMatrix();
  translate(width/2, height/2);

  final float D = 120;
  float r, t, dt, d;
  // circle
  noStroke();
  for ( int i = 0; i < 12; i++ ) {
    translate(D*random(-1, 1), D*random(-1, 1));
    r = random(120, 720);
    dt = random(PI/48, PI/16);
    d = random(20, 160);
    if ( random(2) < 2 ) {
      fill(random(255), random(255), random(255));
    } else {
      fill(random(200, 255));
    }
    for ( t = 0; t <= TWO_PI; t += dt ) {
      circle(r*cos(t), r*sin(t), d);
    }
  }
  // square
  noFill();
  for ( int i = 0; i < 32; i++ ) {
    translate(D*random(-1, 1), D*random(-1, 1));
    strokeWeight(random(12, 20));
    dt = random(PI/32, PI/16);
    d = random(200, 1000);
    stroke(random(200, 255));
    for ( t = 0; t < TWO_PI; t += dt ) {
      square(0, 0, d);
    }
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("337.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
