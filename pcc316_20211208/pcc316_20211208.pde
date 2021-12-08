/* 316_20211208 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(30);
  waveBlocks();
}


void waveBlocks() {

  final float L = 75;

  ajust(L);
  for ( int r = 0; r < height/L+1; r++ ) {
    for ( int c = 0; c < width/L+1; c++ ) {
      frame(c*L, r*L, L);
      pushMatrix();
      translate(c*L+L/2, r*L+L/2);
      rotate((int)random(-4, 4)*HALF_PI);
      translate(-L/2, 0);
      plotWavePoints(wavePoints((int)random(8, 32), L));
      popMatrix();
    }
  }

  return ;
}


void ajust(float l) {

  float widthGutter = (l * (floor(width/l) + 1) - width) / 2;
  float heightGutter = (l * (floor(height/l) + 1) - height) / 2;
  
  translate(-widthGutter, -heightGutter);

  return ;
}


void frame(float x, float y, float l) {

  noFill();
  stroke(255);
  square(x, y, l);

  return ;
}


PVector[] wavePoints(int n, float l) {

  PVector[] ps = new PVector[n];
  float dx, a, t, dt;

  dx = l / n;
  a = random(0.6, 1.0) * l / 2;
  t = random(-PI, PI);
  dt = PI / random(3, 16);

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i] = new PVector(dx/2+i*dx, a*cos(t));
    t += dt;
  }

  return ps;
}


void plotWavePoints(PVector[] ps) {

  final color[] cs = {
    color(163, 214, 206), 
    color(100, 187, 186), 
    color( 63, 171, 155), 
    color(133, 203, 191), 
    color(165, 213, 183), 
    color( 89, 188, 157), 
    color(100, 157, 112), 
    color( 48, 128, 152), 
    color( 74, 172, 188), 
    color(234,  77,  21), 
    color(214,  85,  11)
  };

  stroke(cs[(int)random(cs.length)]);
  fill(cs[(int)random(cs.length)]);

  for ( int i = 0; i < ps.length; i++ ) {
    circle(ps[i].x, ps[i].y, 3);
    line(ps[i].x, 0, ps[i].x, ps[i].y);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("316.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
