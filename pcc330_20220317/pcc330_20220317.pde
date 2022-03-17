/* 330_20220317 */

void setup() {
  size(1150, 800, P3D);
  noLoop();
  blendMode(ADD);
  noiseSeed(243);
}

void draw() {
  background(30);
  translate(width/2, height/2, 0);
  camera(width/2, height/2, 1200, 0, 0, 0, 0, 1, 0);

  final float r = 480;
  final float dt = PI / 1024;
  final float dp = PI / 512;
  final float D = 1200;
  final float cd = 5;

  float x, y, z, dx, dy, dz;
  for ( float t = 0; t < PI; t += dt ) {
    for ( float p = 0; p < TWO_PI; p += dp ) {
      pushMatrix();
      x = r * sin(t) * cos(p);
      y = r * sin(t) * sin(p);
      z = r * cos(t);
      dx = D * (noise(x/500) - 0.5);
      dy = D/1.6 * (noise(y/800) - 0.5);
      dz = D * (noise(z/200) - 0.5);
      translate(x+dx, y+dy, z+dz);
      noStroke();
      fill(255*noise(t/PI, p/TWO_PI), 80*noise(t/PI), 30*noise(p/TWO_PI));
      circle(0, 0, cd);
      rotateY(t);
      rotateZ(p);
      popMatrix();
    }
  }

  saveFrame("330.png");
}
