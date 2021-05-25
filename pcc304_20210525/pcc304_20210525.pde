/* 304_20210525 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(0);
  for ( int i = 0; i < 200; i++ ) {
    noiseRhombus(random(width), random(height), random(80, 320));
  }
}


void noiseRhombus(float cx, float cy, float l) {

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

  PGraphics p = createGraphics((int)(2*sqrt(3)*l), (int)l);
  float a, t, x, y;

  noiseSeed((long)random(9999));

  a = random(10);
  t = random(-PI, PI);
  x = random(2*sqrt(3)*l);
  y = random(l);

  p.beginDraw();
  p.translate(sqrt(3)*l/2, l/2);
  p.blendMode(SCREEN);
  p.stroke(cs[(int)random(cs.length)]);
  for ( int i = 0; i < 3; i++ ) {
    for ( int j = 0; j < 5000; j++ ) {
      if ( isInRhombus(x, y, l) ) {
        p.point(x, y);
        t = TWO_PI * noise(a*x/l, a*y/l);
        x += a * cos(t);
        y += a * sin(t);
      } else {
        x = random(2*sqrt(3)*l);
        y = random(l);
      }
    }
  }
  p.beginShape();
  p.endDraw();

  pushMatrix();
  translate(cx-l/2, cy-l/2);
  rotate(random(-PI, PI));
  image(p, 0, 0);
  popMatrix();

  return ;
}


boolean isInRhombus(float x, float y, float l) {

  if ( x >= 0 ) {
    if ( -l/2+x/sqrt(3) < y && y < l/2-x/sqrt(3) ) {
      return true;
    }
  } else {
    if ( -l/2-x/sqrt(3) < y && y < l/2+x/sqrt(3) ) {
      return true;
    }
  }

  return false;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("304.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
