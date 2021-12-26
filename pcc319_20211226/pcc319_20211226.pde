/* 319_20211226 */

void setup() {
  size(1150, 800);
  noLoop();
}


void draw() {
  background(240);
  waveBlocks();
}


void waveBlocks() {

  final float L = 75;

  ajust(L);
  for ( int r = 0; r < height/L+1; r++ ) {
    for ( int c = 0; c < width/L+1; c++ ) {
      icon(c*L, r*L, L);
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


void icon(float x, float y, float l) {

  final int DOTN = 5;
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

  boolean[] isDotExist;
  float dotl = l / (DOTN + 1);

  // frame
  stroke(0);
  noFill();
  square(x, y, l);

  noStroke();
  fill(cs[(int)random(cs.length)]);

  for ( int i = 0; i < DOTN; i++ ) {
    isDotExist = mirrorDot(DOTN);
    for ( int j = 0; j < DOTN; j++ ) {
      if ( isDotExist[j] ) {
        square(x+dotl/2+j*dotl, y+dotl/2+i*dotl, dotl);
      }
    }
  }

  return ;
}


boolean[] mirrorDot(int n) {

  boolean[] isDotExist = new boolean[n];

  for ( int i = 0; i < n/2; i++ ) {
    isDotExist[i] = ( random(2) < 1 )? true : false;
    isDotExist[n-1-i] = isDotExist[i];
  }
  if ( n % 2 != 0 ) {
    isDotExist[int(n/2)] = ( random(2) < 1 )? true : false;
  }

  return isDotExist;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("319.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
