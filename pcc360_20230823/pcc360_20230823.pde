/* 360_20230823 */

final color[] cs = {
  color(149, 155, 169),
  color( 94, 101, 102),
  color(211, 210, 191),
  color( 36,  49,  70),
  color( 62,  49,  70),
  color( 62,  87, 112),
  color(217, 117,  86),
  color(241, 173,  95),
  color(225, 198, 192),
  color(224, 140, 122)
};

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  flowbeziers(48);
  colormoons(64);
  flowbeziers(48);
}

void colormoons(int n) {
  final float MINR = 50, MAXR = 800;
  float r, t;

  pushMatrix();
  translate(width/2, height/2);
  noStroke();

  for (int i = 0; i < n; i++) {
    fill(cs[int(random(cs.length))]);
    r = random(MINR, MAXR);
    t = random(-PI, PI);
    circle(r*cos(t), r*sin(t), random(40, 180));
  }

  popMatrix();
}

void flowbeziers(int n) {
  final float MINR = 250;
  final float MAXR = 1000;

  float[] rs = new float[4];
  float[] ts = new float[4];

  pushMatrix();
  translate(width/2, height/2);
  noFill();

  for (int i = 0; i < n; i++) {
    stroke(cs[int(random(cs.length))]);
    for (int j = 0; j < 4; j++) {
      rs[j] = random(MINR, MAXR);
      ts[j] = random(-PI, PI);
    }
    for (int j = 0; j < 8; j++) {
      bezier(
        rs[0]*cos(ts[0]), rs[0]*sin(ts[0]),
        rs[1]*cos(ts[1]), rs[1]*sin(ts[1]),
        rs[2]*cos(ts[2]), rs[2]*sin(ts[2]),
        rs[3]*cos(ts[3]), rs[3]*sin(ts[3])
      );
      for (int k = 0; k < 4; k++) {
        rs[k] += MINR / 50 * random(-1, 1);
        ts[k] += random(-PI, PI) / 128;
      }
    }
  }

  popMatrix();
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("360.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
