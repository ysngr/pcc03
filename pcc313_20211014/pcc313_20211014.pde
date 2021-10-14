/* 313_20211014 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  ripple();
  for ( int i = 0; i < 75; i++ ) {
    noiseLine();
  }
}


void ripple(){

  final float dr = 50;
  
  stroke(128, 100);
  noFill();
  
  for( float r = 0; r < 1.4*width; r += dr ){
    circle(width/2, height/2, r);
  }
  
  return ;
}


void noiseLine() {
  
  float sr, er, st, et;
  
  sr = random(1.4*width) / 2;
  er = random(1.4*width) / 2;
  st = random(-PI, PI);
  et = random(-PI, PI);
  
  pushMatrix();
  translate(width/2, height/2);
  noiseLine(sr*cos(st), sr*sin(st), er*cos(et), er*sin(er), random(30, 100));
  popMatrix();
  
  return ;
}
void noiseLine(float sx, float sy, float ex, float ey, float r) {

  final color[] cs = {
    color( 39,  43,  87), 
    color( 38,  55, 130), 
    color( 84, 122, 170), 
    color(200, 211, 221), 
    color( 79,  94, 117), 
    color( 45,  44,  45), 
    color(233,  77,  71), 
    color(237, 111,   0), 
    color(251, 203, 114)
  };
  final int n = 64;
  final float e = 5;

  float x, y, dx, dy;
  PVector[] cp;

  x = sx;
  y = sy;
  dx = (ex - sx) / dist(sx, sy, ex, ey);
  dy = (ey - sy) / dist(sx, sy, ex, ey);
  cp = circlePoints(x, y, r, n);

  stroke(cs[(int)random(cs.length)], random(30, 80));
  noFill();
  noiseSeed((long)random(9999));

  while ( dist(x, y, ex, ey) > e ) {
    plotShape(cp);
    cp = circlePoints(x, y, r, n);
    x += dx;
    y += dy;
  }

  return ;
}


PVector[] circlePoints(float x, float y, float r, int n) {

  float t, nr;
  PVector[] cp = new PVector[n];

  for ( int i = 0; i < n; i++ ) {
    t = i * (TWO_PI / n);
    nr = r * noise(10*(x+r*cos(t))/width, 10*(y+r*sin(t))/height);
    cp[i] = new PVector(x+nr*cos(t), y+nr*sin(t));
  }

  return cp;
}


void plotShape(PVector[] ps) {

  beginShape();
  for ( PVector p : ps ) {
    vertex(p.x, p.y);
  }
  endShape(CLOSE);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("313.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
