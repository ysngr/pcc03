/* 361_20231119 */

void setup() {
  size(1150, 800);
  noLoop();
}

void draw() {
  background(240);
  for (int i = 0; i < 24; i++) {
    recursiveSpiral(random(width), random(height), 0);
  }
}

void recursiveSpiral(float x, float y, int l) {
  final color[] cs = {
    color(173, 128, 175),
    color(246, 237,  67),
    color(244, 159,  58),
    color( 78, 191, 213),
    color(232,  68, 126),
    color(182, 212,  88),
    color(250, 250, 245),
    color( 83,  78, 138)
  };

  int n = int(random(512, 1024));
  float r = 0;
  float dr = random(0.02, 0.08);
  float t = random(-PI, PI);
  float dt = random(PI) / 1024;

  if (l >= 8) {
    return;
  }

  pushMatrix();
  translate(x, y);
  stroke(cs[int(random(cs.length))]);
  noFill();

  for (int i = 0; i < n; i++) {
    circle(r*cos(t), r*sin(t), 4);
    if (random(512) < 1) {
      recursiveSpiral(r*cos(t), r*sin(t), l+1);
    }
    dr += 0.008 * random(-1, 1);
    dt += random(-PI, PI) / 1024;
    r += dr;
    t += dt;
  }
  popMatrix();
}

void keyPressed() {
  if ( key == 's' ) {
    saveFrame("361.png");
    exit();
  } else if ( key == 'r' ) {
    redraw();
  }
}
