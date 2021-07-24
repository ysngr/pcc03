/* 307_20210724 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  final float[] hs = {height/4, 2*height/4, 3*height/4};
  for ( float h : hs ) {
    for ( int i = 0; i < 240; i++ ) {
      bline(h);
    }
  }
}


void bline(float ih) {

  final color[] cs = {
    color(184,  27,  48), 
    color( 17,   6,  10), 
    color(206, 182,  88), 
    color(202,  70,  73), 
    color( 78,  73,  82), 
    color(220, 210, 169), 
    color(105,   0,  34), 
    color(215, 210, 220), 
    color(115,  79, 135)
  };

  float w = ( random(2) < 1 )? 0 : width;
  float dw = ( w == 0 )? 1 : -1;
  float h = ih;
  float dh = ( random(10) < 1 )? random(20, 50) : random(10);

  strokeWeight(( dh < 10 )? random(2) : random(2, 4));
  stroke(cs[(int)random(cs.length)], random(100, 200));

  for (; 0 <= w && w <= width; w += dw ) {
    h += random(-1, 1) * dh;
    point(w, h);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("307.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
