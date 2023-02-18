/* 352_20230218 */

final float MIND = 40;
final float MAXD = 200;

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 32; i++ ) {
    flower(random(width), random(height), random(MIND, MAXD));
  }
}

void flower(float cx, float cy, float d) {
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
  int layer = int(map(d, MIND, MAXD, 6, 12));
  float r;

  pushMatrix();
  translate(cx, cy);
  for ( int i = 0; i < layer; i++ ) {
    noStroke();
    fill(cs[int(random(cs.length))]);
    rotate(random(-PI, PI));
    beginShape();
    for ( float t = 0; t <= TWO_PI; t += TWO_PI/64 ) {
      r = random(0.8, 1.2) * d / (i + 1);
      curveVertex(r*cos(t), r*sin(t));
      if ( t == 0 || t == TWO_PI ) {
        curveVertex(r*cos(t), r*sin(t));
      }
    }
    endShape(CLOSE);
  }
  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("352.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
