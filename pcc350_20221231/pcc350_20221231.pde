/* 350_20221231 */

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

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 80; i++ ) {
    bezierRibbon(random(width), random(height),
      random(width), random(height),
      random(width), random(height),
      random(width), random(height));
  }
  for ( int i = 0; i < 12; i++ ) {
    orbit(random(width), random(height), 1000, 1000);
  }
}

void bezierRibbon(float sx, float sy, float c1x, float c1y,
                  float c2x, float c2y, float ex, float ey) {
  int n = int(random(16, 128));
  float dx = random(-0.8, 0.8);
  float dy = random(-0.8, 0.8);

  strokeWeight(1);
  stroke(cs[int(random(cs.length))], 200);
  noFill();

  for ( int i = 0; i < n; i++ ) {
    bezier(sx, sy, c1x, c1y, c2x, c2y, ex, ey);
    sx += dx;
    sy += dy;
    ex += dx;
    ey += dy;
  }
}

void orbit(float x, float y, float w, float h) {
  float dx = 4 * random(-1, 1);
  float dy = 4 * random(-1, 1);
  float dw = 12 * random(-1, 1);
  float dh = 12 * random(-1, 1);

  strokeWeight(random(1.5, 2.5));
  stroke(cs[(int)random(cs.length)], random(180, 240));
  noFill();

  for ( int i = 0; i < 8; i++ ) {
    ellipse(x, y, w, h);
    x += dx;
    y += dy;
    w += dw;
    h += dh;
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("350.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
