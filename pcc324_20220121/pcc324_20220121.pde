/* 324_20220121 */

void setup() {
  size(1150, 800, P3D);
  noLoop();
}

void draw() {
  background(240);
  for ( int i = 0; i < 8; i++ ) {
    nsphere(random(width), random(height), random(-20, 20), random(40, 240));
  }
  saveFrame("324.png");
}

void nsphere(float cx, float cy, float cz, float r) {
  int n, m;
  float a, t, p, x, y, z;
  noiseSeed(int(random(1024)));
  stroke(30, 200);
  n = int(random(1, 10));
  for ( int i = 0; i < n; i++ ) {
    a = r;
    t = random(-PI, PI);
    p = random(-PI, PI);
    m = int(random(2500, 5000));
    for ( int j = 0; j < m; j++ ) {
      x = a * sin(t) * cos(p);
      y = a * sin(t) * sin(p);
      z = a * cos(t);
      pushMatrix();
      translate(cx+x, cy+y, cz+z);
      circle(0, 0, 10);
      popMatrix();
      a += 0.5 * (noise(a/1000) - 0.5);
      t += 0.05 * (noise(x/1000, y/1000) - 0.5);
      p += 0.05 * (noise(y/1000, z/1000) - 0.5);
    }
  }
}


void keyPressed() {
  if ( key == 'r' ) {
    redraw();
  }
}
