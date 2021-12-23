/* 318_20211223 */

final int NotCol = 0, ColUpper = 1, ColLower = 2, ColLeft = 3, ColRight = 4;

PVector p, rgb;
float a;
float dx, dy, dr, dred, dgrn, dblu;


void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(0);
  for ( int i = 0; i < 10; i++ ) {
    init();
    for ( int j = 0; j < 10000; j++ ) {
      move();
    }
  }
}


void init() {

  p = new PVector(random(width), random(height), random(10, 40));

  dx = random(-1, 1) * 2;
  dy = random(-1, 1) * 2;
  dr = random(-1, 1) * 0.1;

  rgb = new PVector(random(255), random(255), random(255));
  a = random(5, 10);

  dred = random(-1, 1);
  dgrn = random(-1, 1);
  dblu = random(-1, 1);

  return ;
}


void move() {

  bound();

  p.x += dx;
  p.y += dy;
  p.z += dr;

  plot();

  return ;
}


void bound() {

  if ( p.y - p.z <= 0 && dy < 0 ) {
    dy = -dy;
    updateDr();
  }  
  if ( p.y + p.z >= height && dy > 0 ) {
    dy = -dy;
    updateDr();
  }
  if (  p.x - p.z <= 0 && dx < 0 ) {
    dx = -dx;
    updateDr();
  }
  if ( p.x + p.z >= width && dx > 0 ) {
    dx = -dx;
    updateDr();
  }

  updateColor();

  return ;
}


void updateDr() {

  dr = random(-1, 1) * 0.1;

  return ;
}


void updateColor() {

  dred = sign(rgb.x, dred) * dred;
  dgrn = sign(rgb.y, dgrn) * dgrn;
  dblu = sign(rgb.z, dblu) * dblu;

  rgb.x += dred;
  rgb.y += dgrn;
  rgb.z += dblu;

  return ;
}


int sign(float celem, float d) {

  if ( celem <= 0 && d < 0 ) {
    return -1;
  }
  if ( celem >= 255 && d > 0 ) {
    return -1;
  }

  return 1;
}


void plot() {

  stroke(rgb.x, rgb.y, rgb.z, a);
  noFill();
  circle(p.x, p.y, 2*p.z);

  return ;
}


color getColor() {

  float r = 255 * noise(p.x/1000);
  float g = 255 * noise(p.y/1000);
  float b = 255 * noise(100*p.z);

  return color(r, g, b, 20);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("318.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
