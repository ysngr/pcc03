/* 357_20230504 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 128; i++ ) {
    flowFigure(random(width), random(height), random(40, 80), int(random(3, 12)));
  }
}

void flowFigure(float x, float y, float l, int n) {
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
  float t, s, w, h, sw;
  color c = cs[int(random(cs.length))];
  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  noStroke();
  fill(c, random(60, 120));
  beginShape();
  for ( float i = 0; i < n; i++ ) {
    t = i * TWO_PI / n;
    vertex(l*cos(t), l*sin(t));
  }
  endShape(CLOSE);
  stroke(c);
  for ( float i = 0; i < n; i++ ) {
    t = i * TWO_PI / n;
    w = l * cos(t);
    h = l * sin(t);
    sw = 1;
    for ( int j = 0; j < 1200; j++ ) {
      s = 16 * noise(w/width, h/height);
      w += cos(s);
      h += sin(s);
      sw += 0.0025;
      strokeWeight(sw);
      point(w, h);
    }
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("357.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
