/* 303_20210430 */

void setup() {
  size(1150, 800);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(3, 20, 43);
  for ( int i = 0; i < 70; i++ ) {
    noiseFlow(random(width), random(height));
  }
}


void noiseFlow(float cx, float cy) {

  final color[] cs = {
    color(173, 128, 175), 
    color(246, 237,  67), 
    color(244, 159,  58), 
    color( 78, 191, 213), 
    color(232,  68, 126), 
    color(182, 212 , 88), 
    color(250, 250, 245), 
    color( 83,  78, 138)
  };

  int fn = (int)random(10, 50);
  int pn = (int)random(400, 4000);
  float r = random(10, 100);
  float amp = random(1, 10);
  float dv = random(100, 1000), dy = random(100, 1000);
  float a, t, x, y;

  noiseSeed((long)random(9999));
  strokeWeight(random(1.0, 1.6));
  stroke(cs[(int)random(cs.length)], 160);

  for ( int i = 0; i < fn; i++ ) {
    t = random(-PI, PI);
    x = cx + r * cos(t);
    y = cy + r * sin(t);
    for ( int j = 0; j < pn; j++ ) {
      point(x, y);
      a = amp * noise(x*y/1000);
      t = TWO_PI * noise(x/dv, y/dy);
      x += a * cos(t);
      y += a * sin(t);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("303.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
